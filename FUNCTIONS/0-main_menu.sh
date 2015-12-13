#!/bin/bash
# 0-main_menu.sh
#
# Función que permite entrar en el Menú principal
#
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY TR10 CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 03/12/2015
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function main_menu() {
    clear	
    while [ $OPCION -ne 7 ]
    do
        echo " "
        echo " ADB MANAGER FOR LINUX"
        echo "- - - - - - - - - - - - - - - - - - -"
        echo " 1 - Recovery temporal + Root + Gapps"
        echo " 2 - Reiniciar en Recovery Temporal (TWRP)"
        echo " 3 - Reiniciar en Droidboot (Fastboot)"
        echo " 4 - Reiniciar en Recovery (Nativo/Adb)"
        echo " 5 - Entrar en el shell del dispositivo"
        echo " 6 - Bypass Lock (necesario ser ROOT)"
        echo " 7 - Salir "
        echo "- - - - - - - - - - - - - - - - - - -"
        read -p "Seleccione una opción: " OPCION
        echo " "         

        case $OPCION in        	
            1)
         		temp_recovery_root_gapps           
            ;;

            2)
				reboot_temp_recovery
			
			;;
				
			3)
				reboot_droidboot
			;;

            4)
                reboot_native_recovery
            ;;
			
            5)
				enter_shell
			;;
            
            6)
                bypass_lock
            ;;            

			7)				
                clear;
                echo "GRACIAS POR USAR ESTA HERRAMIENTA!!!";
                echo " ";             
                echo "Puedes colaborar con el desarrollo de una próxima versión con interfaz gráfica";
                echo " ";
                echo "Escribeme y te haré llegar la documentación necesaria";
                echo " ";
                echo "Erick Carvajal R - @neocarvajal";
                echo " ";
			;;

            *) 
                echo " "
				echo "Opción equivocada";
				echo " ";
			;;                
        esac        
    done
}