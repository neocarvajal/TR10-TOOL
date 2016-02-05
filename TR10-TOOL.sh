#!/bin/bash
#TR10-TOOL.sh
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Este script te ayudará en el proceso de rooteo de la Tablet TR10CS1 y TR10RS1
# Debes activar la depuración USB en tu dispositivo para que funcione sin problemas
#
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY TR10 CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 03/12/2015
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# COLABORADOR EN VERSIÓN 1.1.0 CON ENTORNO GRAFICO UTILIZANDO ZENITY
#
# Developer  : Wuilmer Bolivar
# Contact    : http://twitter.com/wuilmerbolivar && http://fb.com/wuilmer22
# Date       : 27/01/2016
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#
# Variables Globales TR10-TOOL---------------------------------------
. FUNCTIONS/0-main_menu.sh
. FUNCTIONS/1-temp_recovery_root_gapps.sh
. FUNCTIONS/2-reboot_temp_recovery.sh
. FUNCTIONS/3-reboot_droidboot.sh
. FUNCTIONS/4-reboot_recovery.sh
. FUNCTIONS/5-enter_shell.sh
. FUNCTIONS/6-reconect_adb_tr10_tool.sh
. FUNCTIONS/7-conections_tr10_tool.sh
. FUNCTIONS/8-bypass_lock.sh
# Función de la barra de progreso---------------------------------------
function timing
{
for i in `seq 1 100`
do
    echo "$i"
    sleep 0.1
done
}
timing | zenity --cancel-label="Omitir" --progress --title=".: TR10-TOOL. V-1.1.0 :." --percentage=0 --auto-close --text="Esta herramienta fue desarrollada por T.S.U Erick Carvajal R con fines educativos. \nCada persona es responsable de su uso." 
# Variables globales ADB--------------------------------------------
adb_globals
# Cerrando viajes conexiones y abriendo servidor ADB----------------
$ADB kill-server
$ADB start-server & zenity --info --title="Notificación importante!" --text="Antes de empezar a trabajar con tu dispositivo, verifica que has activado la depuración USB en el menú desarrollador.\n\nCerrando conexiones ADB viejas...\n...............................................................\nInicializando Servidor ADB..." 
# Conectando -------------------------------------------------------
conections_tr10_tool
# Condición que verifica el estado de conexion a la tablet.
# Al conectarse muestra el menú de opciones....
if [ $ESTADO == $CONECTADO ]; then
    Main
else
    reconect_adb_tr10_tool
    Main
fi
