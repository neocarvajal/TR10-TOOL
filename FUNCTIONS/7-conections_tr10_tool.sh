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
	# Almacenando ruta absoluta TR10TOOL
	DIR="$(pwd)"
	# Asignando binario (adb) a variable global
	#ADB="${DIR}/ANDROID-SDK-LINUX/./adb"
	# Asignando binario (fastboot) a variable global
	#FASTBOOT="${DIR}/ANDROID-SDK-LINUX/./fastboot"
	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		#LinuxOS
		 # Asignando binario (adb) a variable global
		 ADB="${DIR}/ANDROID-SDK-LINUX/platform-tools-linux/./adb"
		 # Asignando binario (fastboot) a variable global
		 FASTBOOT="${DIR}/ANDROID-SDK-LINUX/platform-tools-linux/./fastboot"
		elif [[ "$OSTYPE" == "darwin"* ]]; then
			#MacOSX
			# Asignando binario (adb) a variable global
			ADB="${DIR}/ANDROID-SDK-LINUX/platform-tools-mac/./adb"
			# Asignando binario (fastboot) a variable global
			FASTBOOT="${DIR}/ANDROID-SDK-LINUX/platform-tools-mac/./fastboot"
		#elif [[ "$OSTYPE" == "cygwin" ]]; then
			        # POSIX compatibility layer and Linux environment emulation for Windows
		#elif [[ "$OSTYPE" == "msys" ]]; then
			        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
		#elif [[ "$OSTYPE" == "win32" ]]; then
			        # I'm not sure this can happen.
		#elif [[ "$OSTYPE" == "freebsd"* ]]; then
			        # ...
		#else
	        	# Unknown.
	fi
	# Variables de control
	CONECTADO="device"
	RECONEXION=1
	OPCION=0
}

function conections_tr10_tool {
	# Global Estate ---------------------------------------------------
	# Almacenando estado de conexión de dispositivo vía adb
	ESTADO=$($ADB get-state)
	# Almacenando serial de dispositivo
	SERIAL=$($ADB get-serialno)
}
