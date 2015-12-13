#!/bin/bash
#bypass_lock.sh
#
# Este script te ayudará a realizar el "bypass lock"(desbloqueo) por patron
# y pin de la Tablet TR10CS1 y TR10RS1
#
# Debes activar la depuración USB en tu dispositivo y contar con permisos root
# para que funcione sin problemas
#
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY TR10 CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 12/12/2015
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function bypass_lock() {
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
    
    echo " "
    echo "Bypass Lock (Permisos root son necesarios)"
    echo "- - - - - - - - - - - - - - - - - - -"
    echo " 1 - Bypass Lock (PATRÓN)"    
    echo " 2 - Bypass Lock (PIN / CONTRASEÑA)"        
    echo " 3 - <-- MENU PRINCIPAL"
    echo "- - - - - - - - - - - - - - - - - - -"
    read -p "Seleccione una opción: " opcion
    conections_tr10_tool

     if [ $ESTADO == $CONECTADO ]; then
        if [ $opcion -eq 1 ]; then
            echo " "
            read -t 2 -p "Iniciando Bypass lock por PATRÓN"
        	echo " "  
            echo " "      	        	
        	read -t 2 -p "Trabajando con shell del dispositivo"
            echo " "
            echo " "
        	read -t 2 -p "Eliminando bloqueo"
            echo " "
            echo " "
            $ADB shell su and rm -rf /data/system/gesture.key
            echo " " 
            echo " "
            clear       	            
            echo " "
            read -p "Bypass Success ! - Presione enter para continuar..."
            echo " "
            read -t 2 -p " Dispositivo listo para entrar con cualquier patrón..."           
            echo " "
            echo " "
            read -t 1 -p "Regresando al Menú principal !!!"
            echo " "
            main_menu
            clear
        elif [ $opcion -eq 2 ]; then
            echo " "
            read -t 2 -p "Iniciando Bypass lock por (PIN / CONTRASEÑA)"
            echo " "  
            echo " "                    
            read -t 2 -p "Trabajando con shell del dispositivo"
            echo " "
            echo " "
            read -t 2 -p "Eliminando bloqueo"
            echo " "
            echo " "
            $ADB shell su and rm -rf /data/system/password.key
            echo " " 
            echo " "
            clear                       
            read -p "Bypass Success ! - Presione enter para continuar..."
            echo " "            
            read -t 1 -p "Regresando al Menú principal !!!"
            echo " "
            main_menu
            clear
        else 
             clear
             echo "Regresando al menu principal.."
        fi       
    else        
    	reconect_adb_tr10_tool	
        bypass_lock
    fi
}