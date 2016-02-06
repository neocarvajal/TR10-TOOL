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
function adb_globals {
	# Global SDK ------------------------------------------------------
	DIR=$(pwd)
	ADB="${DIR}/ANDROID-SDK-LINUX/./adb"
	FASTBOOT="${DIR}/ANDROID-SDK-LINUX/./fastboot"
	CONECTADO="device"
	RECONEXION=1
	OPCION=0
}

function conections_tr10_tool {
	# Global Estate ---------------------------------------------------
	ESTADO=`$ADB get-state`	
	#SERIAL=`$ADB get-serialno`	
}

function stream_device {
	DEVICES_NO=0
	$ADB devices -l > D_LOG/DEVICES_CONECTED	
	STREAM_DEVICES=`sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $1}' | wc -l`
	#STREAM_MODEL=`awk '{print $5}'`
	#STREAM_SERIAL=`awk '{print $1}'`
	
	# NultiFlash Tool Signals - Joder el parque con variables para el case de multiflash E R I C K
	E_SIGNAL="100"
	R_SIGNAL="200"
	I_SIGNAL="300"
	C_SIGNAL="400"
	K_SIGNAL="500"
}
