#!/bin/bash
# enter_shell.sh
#
# Función que permite entrar en el shell del dispositivo
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 19/03/2016
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function enter_shell {

    stream_device
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
    max_conection
    conections_tr10_tool
    if [ $ESTADO == $CONECTADO ]; then
	    echo " "
        echo " Seleccione una opción"
        echo "- - - - - - - - - - - - - - - - - - -"
        echo " 1 - Entrar en el Shell"        
        echo " 2 - <-- IR AL MENÚ PRINCIPAL"                
        echo "- - - - - - - - - - - - - - - - - - -"
        read -p "Seleccione una opción: " opcion
        echo " "

        if [ $opcion -eq 1 ]; then
	      	read -t 2 -p "Entrando en el shell $STREAM_MODEL"
	      	echo " "
	      	echo -e "\v \e[33;1m Cuando termine de trabajar puede salir con el comando (exit)
            o haciendo la combinación (Ctrl +d) \e[m"
            echo " "	      		      	
	      	$ADB shell
	    else
            clear
	    	echo "Regresando al Menú principal"
	    fi
    else
     	reconect_adb_tr10_tool
     	main_menu
    fi
}