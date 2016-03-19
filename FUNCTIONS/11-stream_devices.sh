#!/bin/bash
# 11-stream-devices.sh
#
# 
#
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY TR10 CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 28/02/2016
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function stream_device {
	$ADB devices -l > D_LOG/DEVICES_CONECTED
	# Variable de control
	DEVICES_NO=0		
	# Cantidad de equipos conectados (num)
	STREAM_DEVICES=`sed '/* /d' D_LOG/DEVICES_CONECTED | sed '/List/d' | sed '/^$/d' | awk '{print $1}' | wc -l`
	# Modelo de dispositivo
	STREAM_MODEL=`sed '/List/d' D_LOG/DEVICES_CONECTED | sed '/^$/d' | awk '{print $5}'`	
	# MultiFlash Tool Signals
	E_SIGNAL="100"
	R_SIGNAL="200"
	I_SIGNAL="300"
	C_SIGNAL="400"
	# K_SIGNAL="500"
	# TEST_SIGNAL="600"
}