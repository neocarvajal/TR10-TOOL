#!/bin/bash
# 0-main_menu.sh
#
# Función que permite entrar en el Menú principal
#
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 19/03/2016
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function main_menu {
    clear   
    while [[ $OPCION -ne 9 ]]
    do
        echo " "
        echo -e "\v \e[34;1mTR10-TOOL V-1.0\e[m"
        echo "- - - - - - - - - - - - - - - - - - -"
        # echo " 0 - Copiar un archivo de la pc a tu dispositivo"
        echo " 1 - Recovery temporal + Root + Gapps"
        echo " 2 - Reiniciar en Recovery Temporal"
        echo " 3 - Reiniciar en Droidboot (Fastboot)"
        echo " 4 - Reiniciar en Recovery (Nativo)"
        echo " 5 - Entrar en el shell del dispositivo"
        echo " 6 - Bypass Lock (necesario ser ROOT)"
        echo " 7 - Opciones Multiflash"
        echo " 8 - Preparar Conexión TCPIP (Wifi adb)"
        echo " 9 - Salir "
        echo "- - - - - - - - - - - - - - - - - - -"
        read -p "Seleccione una opción: " OPCION
        echo " "

        case $OPCION in

            1)
                . FUNCTIONS/11-stream_devices.sh
                . FUNCTIONS/1-temp_recovery_root_gapps.sh                
                conections_tr10_tool
                temp_recovery_root_gapps
            ;;

            2)
                . FUNCTIONS/11-stream_devices.sh
                . FUNCTIONS/2-reboot_temp_recovery.sh
                conections_tr10_tool
                reboot_temp_recovery            
            ;;
                
            3)
                . FUNCTIONS/11-stream_devices.sh
                . FUNCTIONS/3-reboot_droidboot.sh
                conections_tr10_tool
                reboot_droidboot
            ;;

            4)
                . FUNCTIONS/11-stream_devices.sh
                . FUNCTIONS/4-reboot_recovery.sh
                conections_tr10_tool
                reboot_native_recovery
            ;;
            
            5)
                . FUNCTIONS/11-stream_devices.sh
                . FUNCTIONS/5-enter_shell.sh
                conections_tr10_tool
                enter_shell
            ;;
            
            6)
                . FUNCTIONS/11-stream_devices.sh
                . FUNCTIONS/8-bypass_lock.sh
                conections_tr10_tool
                bypass_lock
            ;;            

            7)
               . FUNCTIONS/11-stream_devices.sh
               . FUNCTIONS/10-multi_flash_option.sh
               . FUNCTIONS/12-multi_flash_tool.sh
               conections_tr10_tool
               multi_flash_option
            ;;

            8)
                . FUNCTIONS/11-stream_devices.sh
               . FUNCTIONS/13-prepare_for_tcpip.sh               
               conections_tr10_tool
               prepare_tcpip
            ;;

            9)
                rm -rf D_LOG/DEVICES_CONECTED
                # Cerrando servidor ADB---------------------------------------------
                $ADB kill-server
                clear
                echo "GRACIAS POR USAR ESTA HERRAMIENTA!!!"
                echo " "
                echo -e "\e[34;1mErick Carvajal R - @neocarvajal\e[m"                 
                echo " "
            ;;

            *)
                clear
                echo " "
                echo "Opción equivocada seleccione otra Opción del Menú"
                echo " "
            ;;
        esac
    done
}