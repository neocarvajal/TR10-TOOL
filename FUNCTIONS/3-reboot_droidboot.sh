#!/bin/bash
# reboot_droidboot.sh
#
# Función que permite reiniciar en modo Droidboot/Fastboot
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY TR10 CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 27/11/2015
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function reboot_droidboot() {	
conections_tr10_tool
	clear
    # Info Dispositivo  -------------------------------------------------
    echo " "
    echo "##################################################"
    echo "           INFORMACIÓN DEL DISPOSITIVO           	"
    echo "#                                                #"
    echo "  Emparejado con Pc $USER                         "                
    echo "#                                                #"
    echo "  Serial: $SERIAL								    "
    echo "#                                                #"
    echo "  `date`                                          "
    echo "#                                                #"    
    echo "##################################################"
    echo " "  
    if [ $ESTADO == $CONECTADO ]; then
	    echo " "
        echo "  Entrar en modo Droidboot/Fastboot"
        echo "- - - - - - - - - - - - - - - - - - -"
        echo " 1 - Reiniciar en modo Droidboot/Fastboot"        
        echo " 2 - <-- MENÚ PRINCIPAL"                
        echo "- - - - - - - - - - - - - - - - - - -"
        read -p "Seleccione una opción: " opcion
        echo " "

        if [ $opcion -eq 1 ]; then
        	echo " "
         	read -t 2 -p "Reiniciando en modo Droidboot/Fastboot -- No toque el dispositivo "
         	echo " "
            $ADB reboot-bootloader && $FASTBOOT getvar all
            echo " "
            read -p "Al finalizar puede Precionar Enter para Iniciar el sistema normalmente "
            echo " " 
            echo "Desea reiniciar el sistema o lo hara manualmente?"
	        echo " "
	        echo " Seleccione una opción"
	        echo "- - - - - - - - - - - - - - - - - - -"
	        echo " 1 - Reiniciar el sistema normalmente"
	        echo " 2 - <-- Salir (Reiniciare manualmente)"                
	        echo "- - - - - - - - - - - - - - - - - - -"
	        read -p "Seleccione una opción: " opcionB
	        echo " "

	        if [ $opcionB -eq 1 ]; then
		       	echo " "
	        	read -t 2 -p "Reiniciando el dispositivo en modo Normal -- No toque el dispositivo "
	        	echo " "
	        	`fastboot continue`
	        	echo " "
	        	echo "Cerrando conexiones ..."	
		       	echo " "        	
		       	$ADB kill-server
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
	        elif [$opcionB -eq 2 ]; then
		       	echo "Cerrando conexiones ..."	
		       	echo " "        	
		       	$ADB kill-server
		       	clear
		       	echo "GRACIAS POR USAR ESTA HERRAMIENTA!!!"
	            echo " "             
	            echo "Puedes colaborar con el desarrollo de una próxima versión con interfaz gráfica"
	            echo " "
	            echo "Escribeme y te haré llegar la documentación necesaria"
	            echo " "
	            echo "Erick Carvajal R - @neocarvajal"
	            echo " "
		       	break
	        fi
	    else
	    	echo "Regresando al Menú principal ..."
        fi
    else
    	reconect_adb_tr10_tool
    	main_menu
   	fi
}
	        



