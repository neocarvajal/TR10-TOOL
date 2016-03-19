#!/bin/bash
# multi_flash.sh
#
# Libreria que permite generar arreglo unidimencional de serial de dispositivos
# y enviarlo por parametro según señal Multiflash asignada
#
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 19/03/2016
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function create_multi_device_array {
    stream_device
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
    sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $5}' | cat -n
    echo " "
    echo "Lista de dispositivos detectados (SERIAL)"
    echo " " 
    sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $1}' | cat -n
    echo $separate $separate
    echo " "
    echo "Cargando serial de dispositivos"
    echo " "
    if [ $STREAM_DEVICES -ge 2 ]; then
        # Cargando serial de dispositivos
        # -------------------------------------------------
        echo "Cantidad dispositivos detectados en el LOG : $STREAM_DEVICES"
        echo " "
        # Secuencia de numeros 1/cantidad de dispositivos en formato lista (sed)
        for item in `seq $STREAM_DEVICES`; do 
            # Asignando valor de dispositivo para 'sed'
            device="sed $item`echo 'd'`"
            # Asignando cambio de dispositivo para 'sed'
            flash_device="$(sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $1}' | $device)"
            echo " "
            # Agreagar valores al arreglo de dispositivos
            flash_device_array=("${flash_device_array[*]}" " $flash_device")
        done              
        echo "Dispositivos cargados ${flash_device_array[*]}"
        echo " "       
        # Flashtool con parametros para flasheo por Señal
        multiflash_tool $1 ${flash_device_array[*]}
        # Eliminando Log
        rm -rf D_LOG/DEVICES_CONECTED
        # - - - - - - - - - - - - - - - - - - - - - - - - -           
    else
        clear
        echo -e "\e[33;1m ***ERROR*** \e[m"
        echo " "
        echo -e "\e[33;1mDebe conectar 2 o más dispositivos para usar esta opción\e[m"
    fi
}

function multi_flash_option {
    stream_device    
    clear
    echo " "
    echo " ¿Desea Empezar o Regresar?"
    echo "- - - - - - - - - - - - - - - - - - - - - - - - "
    echo " 1 - Multi Root and Gapps"
    echo " 2 - Multi Root"
    echo " 3 - Multi Gapps"
    echo " 4 - Multi Droidboot"    
    # echo " 5 - Multi Zip/Update"
    # echo " 6 - Multi Apk Install"
    echo " 5 - <-- MENÚ PRINCIPAL"
    echo "- - - - - - - - - - - - - - - - - - - - - - - - -"
    read -p "Seleccione una opción: " opcion
        # MULTI ROOT AND GAPS (E_SIGNAL)
    if [ $opcion -eq 1 ]; then
        create_multi_device_array $E_SIGNAL
        # MULTI ROOT (R_SIGNAL)
    elif [ $opcion -eq 2 ]; then
       create_multi_device_array $R_SIGNAL
        # MULTI GAPPS (I_SIGNAL)
    elif [ $opcion -eq 3 ]; then
        create_multi_device_array $I_SIGNAL
        # MULTI ZIP/UPDATE (C_SIGNAL)
    elif [ $opcion -eq 4 ]; then
       create_multi_device_array $C_SIGNAL
        #MULTI APK INSTALL (K_SIGNAL)
    # elif [ $opcion -eq 5 ]; then
    #     create_multi_device_array $K_SIGNAL
    # elif [ $opcion -eq 7 ]; then
    #     create_multi_device_array $TEST_SIGNAL
    else
        clear
        echo "Regresando al menú principal"
    fi
}