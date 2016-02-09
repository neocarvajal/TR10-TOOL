#!/bin/bash
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Función que desactiva el menú principal si no esta conectado al dispositivo.
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY TR10 CLI TOOL FOR GNU/LINUX BASH VERSION
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 03/12/2015
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# ENTORNO GRAFICO UTILIZANDO ZENITY
#
# Developer  : Wuilmer Bolivar
# Contact    : http://twitter.com/wuilmerbolivar && http://fb.com/wuilmer22
# Date       : 27/01/2016
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
fzenity() {
	zenity --list --checklist --hide-header --ok-label="Seleccionar" \
	--height=380 --width=300 --title ".: PRINCIPAL :." --hide-column 1 \
	--text "Serial de Tablet: $SERIAL\nEmparejado con PC: $HOSTNAME\n`date`" \
	--column "" --column "Opciones: " \
		"1" "Reiniciar en Recovery Temporal" \
		"2" "Recovery Temporal + Root + Gapps" \
		"3" "Reiniciar en Droidboot (Fastboot)" \
		"4" "Reiniciar en Recovery (Nativo)" \
		"5" "Shell del dispositivo" \
		"6" "Bypass Lock (Root)" \
		"7" "Multiflash (Desarrollando)" \
		"8" "Créditos" \
		"9" "Ayuda"
}
