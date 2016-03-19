#!/bin/bash
# reboot_temp_recovery.sh
#
# Función que permite seleccionar el tipo de recovery
# y entrar para acciones personalizadas 
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 19/03/2016
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function reboot_temp_recovery {
    conections_tr10_tool
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
    echo " Seleccione el recovery a utilizar"
    echo "- - - - - - - - - - - - - - - - - - -"
    echo " 1 - TWRP (Tactil)"
    echo " 2 - ClockworkMod (CWM)"
    echo " 3 - <-- MENU PRINCIPAL"
    echo "- - - - - - - - - - - - - - - - - - -"
    read -p "Seleccione una opción: " opcion
    max_conection
    if [ $ESTADO == $CONECTADO ]; then
        if [ $opcion -eq 1 ]; then
            echo " "
            read -t 1 -p "Ha seleccionado TWRP como recovery temporal!"
        	echo " "  
            echo " "
        	echo "Entrando en el directorio RECOVERY_LIST y seleccionando TWRP por default"
            echo " "
        	cd RECOVERY_LIST/TWRP && ls -l
            echo " "
        	echo "Reiniciando en modo Droidboot -- No toque el dispositivo"
            echo " "
            $ADB reboot-bootloader
            echo " "
        	read -t 4 -p "Flash TWRP on /tmp/recovery.zip -- No toque el dispositivo"
            echo " "
        	$FASTBOOT flash /tmp/recovery.zip twrp_canaima.zip
            echo " "
        	read -t 1 -p "Flash recovery launcher on /tmp/recovery.launcher -- No toque el dispositivo"
        	echo " "
            $FASTBOOT flash /tmp/recovery.launcher twrp_canaima.launcher
            echo " "
        	read -t 1 -p "Iniciando particionado -- No toque el dispositivo"
        	$FASTBOOT oem start_partitioning
            echo " "
        	read -t 1 -p "Flash trigger on /system/bin/logcat -- trabajando"
            echo " "
        	$FASTBOOT flash /system/bin/logcat twrp_canaima.trigger
            echo " "            
        	read -t 1 -p "Deteniendo el particionado para iniciar en TWRP -- trabajando  "
            echo " "
        	$FASTBOOT oem stop_partitioning
            echo " "
            echo "Entrando en TWRP -- No toque el dispositivo"
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
                $ADB reboot
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
        elif [ $opcion -eq 2 ]; then
            echo " "
            read -t 1 -p "Ha seleccionado CWM como recovery temporal!"
            echo " "
            echo " "
            echo "Entrando en el directorio RECOVERY_LIST y seleccionando CWM por default"
            echo " "
            cd RECOVERY_LIST/CWM && ls -l || grep zip
            echo " "
            echo "Reiniciando en modo Droidboot -- No toque el dispositivo"
            echo " "
            $ADB reboot-bootloader
            echo " "
            read -t 4 -p "Flash CWM on /tmp/recovery.zip -- No toque el dispositivo"
            echo " "
            $FASTBOOT flash /tmp/recovery.zip cwm_canaima.zip
            echo " "
            read -t 1 -p "Flash canaima launcher on /tmp/recovery.launcher -- No toque el dispositivo"
            echo " "
            $FASTBOOT flash /tmp/recovery.launcher cwm_canaima.launcher
            echo " "
            read -t 1 -p "Empezando el particionado oem -- No toque el dispositivo"
            echo " "
            $FASTBOOT oem start_partitioning
            echo " "
            read -t 1 -p "Flash canaima trigger on /system/bin/cp -- No toque el dispositivo"
            echo " "
            $FASTBOOT flash /system/bin/cp cwm_canaima.trigger
            echo " "
            read -t 1 -p "Respaldando -- trabajando"
            echo " "
            $FASTBOOT oem backup_factory
            echo " "
            read -t 1 -p "Entrando en CWM -- No toque el dispositivo "
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
                $ADB reboot
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
             echo "Regresando al menu principal"
        fi
    else
    	reconect_adb_tr10_tool
        reboot_temp_recovery
    fi
}