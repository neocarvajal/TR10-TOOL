#!/bin/bash
#  conections_tr10_tool.sh
#
# Función que permite definir las conexiones para la comunicación con los protocolos ADB y FASTBOOT
#
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY TR10 CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 03/12/2015
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function adb_globals() {
	# Global SDK ------------------------------------------------------
	DIR=$(pwd)
	ADB="${DIR}/ANDROID-SDK-LINUX/./adb"
	FASTBOOT="${DIR}/ANDROID-SDK-LINUX/./fastboot"
}

function conections_tr10_tool() {
	# Global Estate ---------------------------------------------------
	ESTADO=`$ADB get-state`
	CONECTADO="device"
	SERIAL=`$ADB get-serialno`
	RECONEXION=1
}