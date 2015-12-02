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
# Date       : 27/11/2015
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function reconect_adb_tr10_tool() {	
. conections_tr10_tool.sh   # Variables globales
    while [ $RECONEXION -ne 4 ]; do            
        echo " "
        echo "Imposible establer conexión con el dispositivo"
        echo " "
        echo "Por favor verifique la conexión via USB de su dispositivo "
        echo " "
        echo "y la activación de la depuración USB "
        echo " "
        echo "Iniciando autodetección Nº $reconexion.."
        echo " "            
        adb wait-for-device
        echo " "              
        if [ $ESTADO == $CONECTADO ];then
            echo "Conexion reestablecida"
            echo " "                                        
            return             
        else
            let "reconexion++"
        fi            
    done
    echo "Imposible establecer conexión..."
    echo " "   
    adb kill-server
    echo "Saliendo..."	
    exit
}