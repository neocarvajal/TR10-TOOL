#!/bin/bash
# multi_flash.sh
#
# Función que permite enviar los archivos Super SU (root) y las Gapps (Google Apps)
# para luego entrar en recovery TWRP (touch) a más de un dispositivo !
#
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY TR10 CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 31/01/2016
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function multi_flash_option { 
    stream_device
    clear                 
    echo " "
    echo " ¿Desea Empezar o Regresar?"
    echo "- - - - - - - - - - - - - - - - - - - - - - - - "
    echo " 1 - Multi Root and Gapps" 
    echo " 2 - Multi Root"           
    echo " 3 - Multi Gapps"
    echo " 4 - Multi Zip/Update" 
    echo " 5 - Multi Apk Install"
    echo " 6 - <-- MENÚ PRINCIPAL"                
    echo "- - - - - - - - - - - - - - - - - - - - - - - - -"
    read -p "Seleccione una opción: " opcion  
    # MULTI ROOT AND GAPS (E_SIGNAL)
    if [ $opcion -eq 1 ]; then            
        #  ------------------------------------------------- 
        echo " "
        echo "Reconociendo dispositivos conectados -- No toque los dispositivos"
        echo " "
        echo "Generando archivo Log en el directorio D_LOG/"
        echo " "        
        ls -l D_LOG/
        echo " "
        echo "Realizando operaciónes necesarias sobre el archivo Log generado -- Espere"
        echo " "
        # Lista de dispositivos conectados a TR10-TOOl
        separate="======================"    
        echo "Lista de dispositivos detectados (MODEL)"
        echo " " 
        echo $separate $separate 
        sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $5}'L | cat -n 
        echo " "
        echo "Lista de dispositivos detectados (SERIAL)"
        echo " " 
        sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $1}' | sed 's/model://' | cat -n
        echo $separate $separate
        echo " "
        echo "Cargando serial de dispositivos"
        echo " "
        # Cargando serial de dispositivos 
        # -------------------------------------------------            
        echo "Cantidad dispositivos detectados en el LOG : $STREAM_DEVICES"        
        echo " "
        # Secuencia de numeros 1/cantidad de dispositivos
        for item in `seq $STREAM_DEVICES`; do 
            # Asignando valor de dispositivo para 'sed'
            device="sed $item`echo 'd'`"            
            # Asignando cambio de dispositivo para 'sed'            
            flash_device="$(sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $1}' | $device)"
            # Agreagar valores al arreglo de dispositivos
            #${flash_device_array[$item]}+=" $flash_device"            
            echo " "    
            flash_device_array=("${flash_device_array[*]}" " $flash_device")
        done              
        echo "Dispositivos cargados"    
        # Imprimiendo Array con seriales de los dispositivos seleccionados                 
        echo "${flash_device_array[*]}" 
        echo " "
        # Flashtool con parametros para flasheo por Señal 
        multiflash_tool $E_SIGNAL ${flash_device_array[*]}
        # Eliminando Log
        rm -rf D_LOG/DEVICES_CONECTED
        # - - - - - - - - - - - - - - - - - - - - - - - - -

    # MULTI ROOT (R_SIGNAL)
    elif [ $opcion -eq 2 ]; then
        #  ------------------------------------------------- 
        echo " "
        echo "Reconociendo dispositivos conectados -- No toque los dispositivos"
        echo " "
        echo "Generando archivo Log en el directorio D_LOG/"
        echo " "        
        ls -l D_LOG/
        echo " "
        echo "Realizando operaciónes necesarias sobre el archivo Log generado -- Espere"
        echo " "
        # Lista de dispositivos conectados a TR10-TOOl
        separate="======================"    
        echo "Lista de dispositivos detectados (MODEL)"
        echo " " 
        echo $separate $separate 
        sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $5}'L | cat -n 
        echo " "
        echo "Lista de dispositivos detectados (SERIAL)"
        echo " " 
        sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $1}' | sed 's/model://' | cat -n
        echo $separate $separate
        echo " "
        echo "Cargando serial de dispositivos"
        echo " "
        # Cargando serial de dispositivos 
        # -------------------------------------------------            
        echo "Cantidad dispositivos detectados en el LOG : $STREAM_DEVICES"        
        echo " "
        # Secuencua de numeros 1/cantidad de dispositivos
        for item in `seq $STREAM_DEVICES`; do 
            # Asignando valor de dispositivo para 'sed'
            device="sed $item`echo 'd'`"            
            # Asignando cambio de dispositivo para 'sed'            
            flash_device="$(sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $1}' | $device)"
            # Agreagar valores al arreglo de dispositivos
            #${flash_device_array[$item]}+=" $flash_device"            
            echo " "    
            flash_device_array=("${flash_device_array[*]}" " $flash_device")
        done              
        echo "Dispositivos cargados"    
        # Imprimiendo Array con seriales de los dispositivos seleccionados                 
        echo "${flash_device_array[*]}" 
        echo " "
        # Flashtool con parametros para flasheo por Señal 
        multiflash_tool $R_SIGNAL ${flash_device_array[*]}
        # Eliminando Log
        rm -rf D_LOG/DEVICES_CONECTED
        # - - - - - - - - - - - - - - - - - - - - - - - - -
    fi
    # MULTI GAPPS (I_SIGNAL)
    elif [ $opcion -eq 3]; then
        #  ------------------------------------------------- 
        echo " "
        echo "Reconociendo dispositivos conectados -- No toque los dispositivos"
        echo " "
        echo "Generando archivo Log en el directorio D_LOG/"
        echo " "        
        ls -l D_LOG/
        echo " "
        echo "Realizando operaciónes necesarias sobre el archivo Log generado -- Espere"
        echo " "
        # Lista de dispositivos conectados a TR10-TOOl
        separate="======================"    
        echo "Lista de dispositivos detectados (MODEL)"
        echo " " 
        echo $separate $separate 
        sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $5}'L | cat -n 
        echo " "
        echo "Lista de dispositivos detectados (SERIAL)"
        echo " " 
        sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $1}' | sed 's/model://' | cat -n
        echo $separate $separate
        echo " "
        echo "Cargando serial de dispositivos"
        echo " "
        # Cargando serial de dispositivos 
        # -------------------------------------------------            
        echo "Cantidad dispositivos detectados en el LOG : $STREAM_DEVICES"        
        echo " "
        # Secuencua de numeros 1/cantidad de dispositivos
        for item in `seq $STREAM_DEVICES`; do 
            # Asignando valor de dispositivo para 'sed'
            device="sed $item`echo 'd'`"            
            # Asignando cambio de dispositivo para 'sed'            
            flash_device="$(sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $1}' | $device)"
            # Agreagar valores al arreglo de dispositivos
            #${flash_device_array[$item]}+=" $flash_device"            
            echo " "    
            flash_device_array=("${flash_device_array[*]}" " $flash_device")
        done              
        echo "Dispositivos cargados"    
        # Imprimiendo Array con seriales de los dispositivos seleccionados                 
        echo "${flash_device_array[*]}" 
        echo " "
        # Flashtool con parametros para flasheo por Señal 
        multiflash_tool $I_SIGNAL ${flash_device_array[*]}
        # Eliminando Log
        rm -rf D_LOG/DEVICES_CONECTED
        # - - - - - - - - - - - - - - - - - - - - - - - - -
    fi
    # MULTI ZIP/UPDATE (C_SIGNAL)
    elif [ $opcion -eq 4]; then
        #  ------------------------------------------------- 
        echo " "
        echo "Reconociendo dispositivos conectados -- No toque los dispositivos"
        echo " "
        echo "Generando archivo Log en el directorio D_LOG/"
        echo " "        
        ls -l D_LOG/
        echo " "
        echo "Realizando operaciónes necesarias sobre el archivo Log generado -- Espere"
        echo " "
        # Lista de dispositivos conectados a TR10-TOOl
        separate="======================"    
        echo "Lista de dispositivos detectados (MODEL)"
        echo " " 
        echo $separate $separate 
        sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $5}'L | cat -n 
        echo " "
        echo "Lista de dispositivos detectados (SERIAL)"
        echo " " 
        sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $1}' | sed 's/model://' | cat -n
        echo $separate $separate
        echo " "
        echo "Cargando serial de dispositivos"
        echo " "
        # Cargando serial de dispositivos 
        # -------------------------------------------------            
        echo "Cantidad dispositivos detectados en el LOG : $STREAM_DEVICES"        
        echo " "
        # Secuencua de numeros 1/cantidad de dispositivos
        for item in `seq $STREAM_DEVICES`; do 
            # Asignando valor de dispositivo para 'sed'
            device="sed $item`echo 'd'`"            
            # Asignando cambio de dispositivo para 'sed'            
            flash_device="$(sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $1}' | $device)"
            # Agreagar valores al arreglo de dispositivos
            #${flash_device_array[$item]}+=" $flash_device"            
            echo " "    
            flash_device_array=("${flash_device_array[*]}" " $flash_device")
        done              
        echo "Dispositivos cargados"    
        # Imprimiendo Array con seriales de los dispositivos seleccionados                 
        echo "${flash_device_array[*]}" 
        echo " "
        # Flashtool con parametros para flasheo por Señal 
        multiflash_tool $C_SIGNAL ${flash_device_array[*]}
        # Eliminando Log
        rm -rf D_LOG/DEVICES_CONECTED
        # - - - - - - - - - - - - - - - - - - - - - - - - -
    fi
    #MULTI APK INSTALL (K_SIGNAL)
    elif [ $opcion -eq 3]; then
        #  ------------------------------------------------- 
        echo " "
        echo "Reconociendo dispositivos conectados -- No toque los dispositivos"
        echo " "
        echo "Generando archivo Log en el directorio D_LOG/"
        echo " "        
        ls -l D_LOG/
        echo " "
        echo "Realizando operaciónes necesarias sobre el archivo Log generado -- Espere"
        echo " "
        # Lista de dispositivos conectados a TR10-TOOl
        separate="======================"    
        echo "Lista de dispositivos detectados (MODEL)"
        echo " " 
        echo $separate $separate 
        sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $5}'L | cat -n 
        echo " "
        echo "Lista de dispositivos detectados (SERIAL)"
        echo " " 
        sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $1}' | sed 's/model://' | cat -n
        echo $separate $separate
        echo " "
        echo "Cargando serial de dispositivos"
        echo " "
        # Cargando serial de dispositivos 
        # -------------------------------------------------            
        echo "Cantidad dispositivos detectados en el LOG : $STREAM_DEVICES"        
        echo " "
        # Secuencua de numeros 1/cantidad de dispositivos
        for item in `seq $STREAM_DEVICES`; do 
            # Asignando valor de dispositivo para 'sed'
            device="sed $item`echo 'd'`"            
            # Asignando cambio de dispositivo para 'sed'            
            flash_device="$(sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $1}' | $device)"
            # Agreagar valores al arreglo de dispositivos
            #${flash_device_array[$item]}+=" $flash_device"            
            echo " "    
            flash_device_array=("${flash_device_array[*]}" " $flash_device")
        done              
        echo "Dispositivos cargados"    
        # Imprimiendo Array con seriales de los dispositivos seleccionados                 
        echo "${flash_device_array[*]}" 
        echo " "
        # Flashtool con parametros para flasheo por Señal 
        multiflash_tool $K_SIGNAL ${flash_device_array[*]}
        # Eliminando Log
        rm -rf D_LOG/DEVICES_CONECTED
        # - - - - - - - - - - - - - - - - - - - - - - - - -
    fi
    else 
        clear
        echo "Regresando al menú principal"
    fi       
}