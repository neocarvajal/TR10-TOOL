#!/bin/bash
# reboot_droidboot.sh
#
# Función que permite reiniciar en modo Droidboot/Fastboot
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY TR10 CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 03/12/2015
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function reboot_native_recovery() {	
    conections_tr10_tool
	clear
    # Info Dispositivo  -------------------------------------------------
    echo " "
    echo "##################################################"
    echo "           INFORMACIÓN DEL DISPOSITIVO           	"
    echo "#                                                #"
    echo "  Emparejado con Pc $HOSTNAME                     "                
    echo "#                                                #"
    echo "  Serial: $SERIAL								    "
    echo "#                                                #"
    echo "  `date`                                          "
    echo "#                                                #"    
    echo "##################################################"
    echo " "  
    if [ $ESTADO == $CONECTADO ]; then
	    echo " "
        echo "  Entrar en modo Recovery (Nativo)"
        echo "- - - - - - - - - - - - - - - - - - -"
        echo " 1 - Reiniciar en modo Recovery (Nativo)"        
        echo " 2 - <-- MENÚ PRINCIPAL"                
        echo "- - - - - - - - - - - - - - - - - - -"
        read -p "Seleccione una opción: " opcion       
                        
        if [ $opcion -eq 1 ]; then
        	echo " "
         	read -t 2 -p "Reiniciando en modo Recovery (Nativo) -- No toque el dispositivo "
         	echo " "
            $ADB reboot recovery 
            echo " "
            echo "Una vez reiniciado el dispositivo presione la siguiente combinación 1 o 2 veces: " 
            echo " "          
            echo "Volumen Up + Volumen Down"
            echo " "
            read -p "Presione enter para salir ..."
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
	       	break	        
	    else
	    	echo "Regresando al Menu principal ..."
        fi
    else
    	reconect_adb_tr10_tool
    	main_menu
   	fi
}
	        



