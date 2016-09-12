#!/bin/bash
# reboot_droidboot.sh
#
# Función que permite reiniciar en modo Droidboot/Fastboot
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 19/03/2016
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function reboot_droidboot {	

	clear
    # Info Dispositivo  -------------------------------------------------
    echo " "
    echo "##############################################"
    echo -e "\t\e[2;34;1mINFORMACIÓN DEL DISPOSITIVO\e[m"
    echo "#                                            #"
    echo "  Emparejado con Pc $HOSTNAME                 "
    echo "#                                            #"
    echo "  Serial: $SERIAL                             "
    echo "#                                            #"
    echo "  `date`                                      "
    echo "#                                            #"
    echo "##############################################"
    echo " " 
    
    echo " "
    echo "  Entrar en modo Droidboot/Fastboot"
    echo "- - - - - - - - - - - - - - - - - - -"
    echo " 1 - Reiniciar en modo Droidboot/Fastboot"
    echo " 2 - <-- MENÚ PRINCIPAL"
    echo "- - - - - - - - - - - - - - - - - - -"
    read -p "Seleccione una opción: " opcion
    max_conection
    conections_tr10_tool
    if [ $ESTADO == $CONECTADO ]; then
        if [ $opcion -eq 1 ]; then
        	echo " "
         	read -t 1 -p "Reiniciando en modo Droidboot/Fastboot -- No toque el dispositivo "
         	echo " "
            $ADB reboot-bootloader
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
                read -t 1 -p "Reiniciando el dispositivo en modo Normal -- No toque el dispositivo "
                echo " "
            	$FASTBOOT continue
            	echo " "
                echo "Cerrando conexiones ..."
                echo " "
                $ADB kill-server
                clear
                echo "GRACIAS POR USAR ESTA HERRAMIENTA!!!"
                echo " "
                echo -e "\v \e[33;1mErick Carvajal R - @neocarvajal\e[m"
                echo " "
                break
            elif [ $opcionB -eq 2 ]; then
                echo " "      
                echo "Cerrando conexiones ..."  
                echo " "
                $ADB kill-server
                clear
                echo "GRACIAS POR USAR ESTA HERRAMIENTA!!!"
                echo " "
                echo -e "\v \e[33;1mErick Carvajal R - @neocarvajal\e[m"
                echo " "
                break
            fi
        else
            clear
        	echo "Regresando al Menú principal ..."
        fi
    else
    	reconect_adb_tr10_tool
    	main_menu
   	fi
}