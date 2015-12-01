#!/bin/bash
# temp_recovery_root_gapps.sh
#
# Función que permite definir las conexiones para la comunicación con los protocolos ADB y FASTBOOT
#
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY TR10 CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 27/11/2015
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
ESTADO=`adb get-state`
CONECTADO="device"
SERIAL=`adb get-serialno`
RECONEXION=1