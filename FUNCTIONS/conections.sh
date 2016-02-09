#!/bin/bash
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Función que permite declarar las variables necesarias de conexión
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
#= = = = = = = = = = Permite conectarse al dispositivo = = = = = = = = = =
fconections_tr10_tool() {
	ESTADO=`$ADB get-state`
	CONECTADO="device"
	SERIAL=`$ADB get-serialno`
	RECONEXION=1
	OPCION=0
}
