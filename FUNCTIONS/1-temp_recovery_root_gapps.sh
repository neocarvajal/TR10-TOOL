#!/bin/bash
# temp_recovery_root_gapps.sh
#
# Función que permite enviar los archivos Super SU (root) y las Gapps (Google Apps)
# para luego entrar en recovery TWRP (touch)
#
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY TR10 CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 27/11/2015
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function temp_recovery_root_gapps() {
. conections_tr10_tool.sh	# Variables globales
	clear   
    # Info Dispositivo  -------------------------------------------------
    echo " "
    echo "##################################################"
    echo "           INFORMACIÓN DEL DISPOSITIVO            "
    echo "#                                                #"
    echo "  Emparejado con Pc $USER                         "                
    echo "#                                                #"
    echo "  Serial: $SERIAL                                 "
    echo "#                                                #"
    echo "  `date`                                          "
    echo "#                                                #"    
    echo "##################################################"
    echo " "  
    if [ $ESTADO == $CONECTADO ]; then
	    echo " "
        echo " ¿Desea Empezar o Regresar?"
        echo "- - - - - - - - - - - - - - - - - - - - - - - - "
        echo " 1 - Custom Recovery (TWRP Tactil) Root + Gapps"
        echo " 2 - <-- MENÚ PRINCIPAL"                
        echo "- - - - - - - - - - - - - - - - - - - - - - - - -"
        read -p "Seleccione una opción: " opcion
        echo " "

        if [ $opcion -eq 1 ]; then
            echo " "
            read -t 1 -p "Ha seleccionado TWRP como recovery temporal!"         
            echo " "
            echo "Entrando en el directorio SUPER_SU"
            echo " "
            cd SUPER_SU/ && ls -l
            echo " "                    
            echo "Copiando SUPER SU a la memoria interna del dispositivo"           
            echo " "
            $ADB push -p super_su-canaima.zip /sdcard/ 
            echo " "
            echo "Saliendo del directorio SUPER_SU.."
            echo " "
            echo "Entrando en directorio GAPPS"
            echo " "
            cd ../GAPPS && ls -l
            echo " "
            echo "Copiando GAPPS x86 for Canaima Intel a la memoria interna del dispositivo"           
            echo " "
            read -t 1 -p "Copiando 215MB esto podría tardar unos minutos -- No toque el dispositivo"
            echo " "
            $ADB push -p open_gapps-x86.zip /sdcard/
            echo "Saliendo del direcciontio GAPPS y entrando en RECOVERY_LIST"   
            echo " "       
            cd ../RECOVERY_LIST/TWRP && ls -l
            echo " "
            read -t 2 -p "Reiniciando en modo Droidboot -- No toque el dispositivo"
            echo " "
            $ADB reboot-bootloader && $FASTBOOT getvar all            
            echo " "
            read -t 6 -p "Flash TWRP on /tmp/recovery.zip -- No toque el dispositivo"
            echo " "
            $FASTBOOT flash /tmp/recovery.zip twrp_canaima.zip
            echo " "
            read -t 2 -p "Flash recovery launcher on /tmp/recovery.launcher -- No toque el dispositivo"
            echo " "
            $FASTBOOT flash /tmp/recovery.launcher twrp_canaima.launcher
            echo " "
            read -t 2 -p "Iniciando particionado -- No toque el dispositivo"
            echo " "
            $FASTBOOT oem start_partitioning
            echo " "
            read -t 2 -p "Flash trigger on /system/bin/logcat -- trabajando"
            echo " "
            $FASTBOOT flash /system/bin/logcat twrp_canaima.trigger
            echo " "            
            read -t 2 -p "Deteniendo el particionado para iniciar en TWRP -- trabajando"
            echo " "
            $FASTBOOT oem stop_partitioning
            echo " "
            echo " Saliendo al directorio principal ..."
            cd ../../ && ls -l 
            echo " "
            clear
            echo "GRACIAS POR USAR ESTA HERRAMIENTA!!!"
            echo " "             
            echo "Puedes colaborar con el desarrollo de una próxima versión con interfaz gráfica"
            echo " "
            echo "Escríbeme y te haré llegar la documentación necesaria"
            echo " "
            echo "Erick Carvajal R - @neocarvajal"
            echo " "
        else 
            clear
            echo "Regresando al menú principal"
        fi       
    else
    	reconect_adb_tr10_tool
        main_menu
    fi
}