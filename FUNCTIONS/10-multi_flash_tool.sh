#!/bin/bash
# multiflash_tool.sh
#
# Función que permite Flasheo, Instalación Multiple 
#
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY TR10 CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 31/01/2016
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Global device info ----------------------------------------------
  
    # SERIAL=`$ADB get-serialno`
    # MODELO=`$ADB shell getprop | grep ro.product.model | awk '{print $2}'`
    # FABRICANTE=`$ADB shell getprop | grep manufacturer | awk '{print $2}'`
    # ANDROID_VER=`$ADB shell getprop | grep ro.build.version.release | awk '{print $2}'`

# Global device info todavía en testing ----------------------------

function multiflash_tool { 	
	echo "Multiflash for TR10-TOOL 1.0.0"
	echo "============================== "	
	case $1 in  
		# E_SIGNAL="100" = "Multi Root and Gapps" #		
        "100")			
			# Recorriendo el arreglo de dispositivos  - - - - - - - - - - 
			echo "Device Selected"			
			for item in ${!flash_device_array[*]}; do
				echo ${flash_device_array[$item]}
			done
			echo "============================== "
			# Dimension del arreglo - - - - - - - - - - - - - - - - - - -
			#echo ${#flash_device_array[@]}
		    read -t 1 -p "Seleccionando TWRP como recovery temporal!"         
		    echo " "
		    echo "Entrando en el directorio SUPER_SU"
		    echo " "
		    # Entrando en el directorio SUPER_SU
		    cd SUPER_SU/ && ls -l
		    echo " "                    
		    echo "Copiando SUPER SU a la memoria interna del dispositivo"           
		    echo " "
		    # Enviando el archivo SUPER_SU a los dispositivos
		    # del arreglo recibido por parametros en el llamado
		    # de la funcion usando la opcion de seleccion de dispositivos
		    # por serial de ADB
			for item in ${flash_device_array[*]}; do
				$ADB -s $item push -p super_su-canaima.zip /sdcard/
			done
		    echo " "
		    echo "Saliendo del directorio SUPER_SU.."            
		    echo " "            
		    echo "Entrando en directorio GAPPS"
		    echo " "
		    # Subiendo un direccitorio y entrando en GAPPS/
		    cd ../GAPPS && ls -l
		    echo " "
		    echo "Copiando GAPPS x86 for Canaima Intel a la memoria interna del dispositivo"           
		    echo " "
		    read -t 1 -p "Copiando 215MB esto podría tardar unos minutos -- No toque el dispositivo"
		    echo " "
		    # Enviando el archivo GAPPS a los dispositivos
		    # del arreglo recibido por parametros en el llamado
		    # de la funcion usando la opcion de seleccion de dispositivos
		    # por serial de ADB
		    for item in ${flash_device_array[*]}; do 		    	
		    	$ADB -s $item push -p open_gapps-x86.zip /sdcard/
		    done
		    echo " "                     
		    echo "Saliendo del direcciontio GAPPS y entrando en RECOVERY_LIST"   
		    echo " " 
		    # Subiendo un directorio y entrando en el directorio RECOVERY_LIST/      
		    cd ../RECOVERY_LIST/TWRP && ls -l
		    echo " "
		    read -t 2 -p "Reiniciando en modo Droidboot -- No toque el dispositivo"
		    echo " "
		    # Reniciando en modo Fastboot/Bootloader a los dispositivos del arreglo 
		    # recibido por parametros en el llamado de la Función
		    for item in ${flash_device_array[*]}; do
		    	$ADB -s $item reboot-bootloader && $FASTBOOT getvar all
		    done
		    echo " "
		    read -t 6 -p "Flash TWRP on /tmp/recovery.zip -- No toque el dispositivo"
		    echo " "
		    for item in ${!flash_device_array[*]}; do		    	
		    	$FASTBOOT -s $(flash_device_array[$item]) flash /tmp/recovery.zip twrp_canaima.zip
		    done
		    echo " "
		    read -t 2 -p "Flash recovery launcher on /tmp/recovery.launcher -- No toque el dispositivo"
		    echo " "
		    for item in ${!flash_device_array[*]}; do 	    	
		    	$FASTBOOT -s $item flash /tmp/recovery.launcher twrp_canaima.launcher
		    done
		    echo " "
		    read -t 2 -p "Iniciando particionado -- No toque el dispositivo"
		    echo " "
		    for item in ${!flash_device_array[*]}; do 		    	
		    	$FASTBOOT -s $item oem start_partitioning
		    done
		    echo " "
		    read -t 2 -p "Flash trigger on /system/bin/logcat -- trabajando"
		    echo " "
		    for item in ${!flash_device_array[*]}; do		    	
		    	$FASTBOOT -s $item flash /system/bin/logcat twrp_canaima.trigger
		    done
		    echo " "            
		    read -t 2 -p "Deteniendo el particionado para iniciar en TWRP -- trabajando"
		    echo " "
		    for item in ${!flash_device_array[*]}; do		    	
		    	$FASTBOOT -s $item oem stop_partitioning
		    done
		    echo " "
		    clear
		    echo " "
            read -p "Al finalizar puede Presionar Enter para Reiniciar el sistema normalmente "
            echo " "             
            echo "Desea reiniciar el sistema o lo hara manualmente?"
            echo " "
            echo " Seleccione una opción"
            echo "- - - - - - - - - - - - - - - - - - -"
            echo " 1 - Reiniciar el sistema normalmente"
            echo " 2 - <-- Salir (Reiniciare manualmente)"
            echo "- - - - - - - - - - - - - - - - - - -"
            read -p "Seleccione una opción: " opcionB

            if [ $opcionB -eq 1 ]; then
                echo " "
                read -t 2 -p "Reiniciando el dispositivo en modo Normal -- No toque el dispositivo "
                echo " "
                for item in ${!flash_device_array[*]}; do
                	$ADB -s $item reboot
                done
                echo " "
                echo "Cerrando conexiones ..."  
                echo " "   
                for item in ${!flash_device_array[*]}; do		    		
                	$ADB -s $item kill-server
                done
                clear
                echo "GRACIAS POR USAR ESTA HERRAMIENTA!!!"
                echo " "             
                echo "Desarrollado por: Erick Carvajal R - @neocarvajal"
                echo " "
                break
            elif [ $opcionB -eq 2 ]; then
                echo " "      
                echo "Cerrando conexiones ..."  
                echo " "
                for item in ${!flash_device_array[*]}; do
                	$ADB -s $item kill-server
                done
                clear
                echo "GRACIAS POR USAR ESTA HERRAMIENTA!!!"
                echo " "             
                echo "Desarrollado por: Erick Carvajal R - @neocarvajal"
                echo " "
                break
            fi
        ;;

        "200")
			echo "Multi Root"
			# Recorriendo el arreglo de dispositivos  - - - - - - - - - - 
			echo "Device Selected"			
			for item in ${!flash_device_array[*]}; do
				echo ${flash_device_array[$item]}
			done
			echo "============================== "
			# Enviando archivo SUPER_SU a los diferentes dispositivos
			echo " "
		    echo "Entrando en el directorio SUPER_SU"
		    echo " "
		    cd SUPER_SU/ && ls -l
		    echo " "                    
		    echo "Copiando SUPER SU a la memoria interna del dispositivo"           
		    echo " "
			for item in ${flash_device_array[*]}; do
				$ADB -s $item push -p super_su-canaima.zip /sdcard/
			done
		    echo " "
		    echo "Archivo SUPER_SU copiado a dispositivos: "
		    for item in ${!flash_device_array[*]}; do
				echo ${flash_device_array[$item]}
			done
			echo " "            
        ;;

        "300")            
        	echo "Multi Gapps"
        	# Recorriendo el arreglo de dispositivos  - - - - - - - - - - 
			echo "Device Selected"			
			for item in ${!flash_device_array[*]}; do
				echo ${flash_device_array[$item]}
			done
			echo "============================== "
			# Enviando archivo GAPPS a los diferentes dispositivos
			echo " "		       
            echo "Entrando en directorio GAPPS"
            echo " "
            cd GAPPS/ && ls -l
            echo " "
            echo "Copiando GAPPS x86 for Canaima Intel a la memoria interna del dispositivo"           
            echo " "
            read -t 1 -p "Copiando 215MB esto podría tardar unos minutos -- No toque el dispositivo"            
            echo " "   
            for item in ${flash_device_array[*]}; do
				$ADB -s $item push -p super_su-canaima.zip /sdcard/
			done
			echo " "
		    echo "Archivo 'open_gapps-x86' copiado a dispositivos: "
		    for item in ${!flash_device_array[*]}; do
				echo ${flash_device_array[$item]}
			done
			echo " "
        ;;
            
        "400")
            echo "Multi Zip/Update"
            # Lo mismo pero Seleccionar arhivos Zip/Update via ZENITY
        ;;               
        "500")
            echo "Multi Apk Install"
            # Lo mismo pero Seleccionar APK's via ZENITY
        ;;   

       	*)
        	echo "no se qué numero es"
     	;;
  	esac
}