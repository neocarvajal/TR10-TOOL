#!/bin/bash
# enter_shell.sh
#
# Función que permite entrar en el shell del dispositivo
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY TR10 CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 27/11/2015
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function enter_shell() {
. conections_tr10_tool.Shell   # Variables globales	
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
        echo " Seleccione una opción"
        echo "- - - - - - - - - - - - - - - - - - -"
        echo " 1 - Entrar en el Shell"        
        echo " 2 - <-- IR AL MENÚ PRINCIPAL"                
        echo "- - - - - - - - - - - - - - - - - - -"
        read -p "Seleccione una opción: " opcion
        echo " "

        if [ $opcion -eq 1 ]; then

	      	read -t 2 -p "Entrando en el shell"
	      	echo " "
	      	echo " "
	      	echo $DISPOSITIVO_FULL
	      	echo " "
	      	$ADB shell
	    else
	    	echo "Regresando al Menú principal"
	    fi
    else
     	reconect_$ADB_tr10_tool
     	main_menu
    fi
}