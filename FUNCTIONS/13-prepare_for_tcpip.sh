#!/bin/bash
# 13-prepare_for_tcpip.sh
#
# Función que permite ajustar propiedad en build.prop 
# para realizar conexión adb vía wifi 
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 12/09/2016
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function prepare_tcpip {

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
    
    echo " ¿Desea Empezar o Regresar?"
    echo "- - - - - - - - - - - - - - - - - - - - - - - - "
    echo " 1 - Preparar Conexión adb vía Wifi"
    echo " 2 - <-- MENÚ PRINCIPAL"
    echo "- - - - - - - - - - - - - - - - - - - - - - - - -"
    read -p "Seleccione una opción: " opcion
    max_conection
    conections_tr10_tool
    if [ $ESTADO == $CONECTADO ]; then
        if [ $opcion -eq 1 ]; then
        	clear
            echo " "
            read -t 1 -p "Iniciando configuración en build.prop"
            echo " "
            echo " "
            $ADB shell getprop | grep tcp
            echo " "
            echo "Estableciendo puerto para conexión tcpip al 5555"
            $ADB shell setprop service.adb.tcp.port 5555
            echo " "
            $ADB shell getprop | grep tcp
            echo " "
            read -p "Presione cualquier tecla para continuar..."   
            echo " "
            GET_IP="$($ADB shell getprop | grep ipaddress)"
			IP="$(echo $GET_IP | awk '{print $2}')"
			TCPIP_CONNECTION="adb connect ${IP}"
			echo " "        
			read -t 2 -p "Desde cualquier host adb use el siguiente comando : "
			echo " "
			echo -e '\e[33;1m '$TCPIP_CONNECTION' \e[m'
			echo " "
			break
        else 
            clear
            echo "Regresando al menú principal"
        fi
    else
    	reconect_adb_tr10_tool
        prepare_tcpip
    fi
}