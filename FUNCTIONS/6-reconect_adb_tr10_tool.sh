#!/bin/bash
# temp_recovery_root_gapps.sh
#
# Funcion que permite establecer la reconexion con el dispositivo
#
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY TR10 CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 03/12/2015
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function reconect_adb_tr10_tool {
    while [ $RECONEXION -ne 4 ]; do
        echo " "
        echo "Imposible establer conexión con el dispositivo"
        echo " "
        echo "Por favor verifique la conexión via USB de su dispositivo "
        echo " "
        echo "y la activación de la depuración USB "
        echo " "
        echo "Iniciando autodetección Nº $RECONEXION.."
        echo " "
        $ADB wait-for-device
        echo " "
        conections_tr10_tool
        if [ $ESTADO == $CONECTADO ]; then
            echo "Conexion reestablecida"
            echo " "
            return
        elif [ $ESTADO != $CONECTADO ]; then
            let "RECONEXION++"
        fi
    done
    echo "Imposible establecer conexión..."
    echo " "
    $ADB kill-server
    echo "Saliendo..."
    exit
}

function max_conection {
    stream_device
     while [ $STREAM_DEVICES -gt 1 ]; do
        clear
        echo -e "\e[31;1m ***ERROR*** \e[m"
        echo " "
        echo -e "\e[31;1mSolo puede usar 1 dispositivo conectado en esta opción\e[m"
        echo " "
        echo -e "\e[2;34;1m Si desea trabajar con 2 o más equipos a la vez valla a Opciones Multiflash\e[m"
        echo " "
        exit
    done
}
