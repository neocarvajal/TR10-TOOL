#!/bin/bash
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Script que permite mostrar el menú y operar de acuerdo a lo selecionado.
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
#= = = = = = = = = = Variables Globales TR10-TOOL = = = = = = = = = =
. FUNCTIONS/adb_globals.sh
. FUNCTIONS/timing.sh
. FUNCTIONS/zenity.sh
. FUNCTIONS/conections.sh

#= = = = = = = = = = Variables Globales ADB = = = = = = = = = =
fadb_globals

#= = = = = = = = = = Función para conectarse a la tablet = = = = = = = = = =
fconections_tr10_tool

#= = = = = = = = = = Función del Menú Principal = = = = = = = = = =
MenuPrincipal() {
 #if [ $SERIAL == 'unknown' ]; then
	#OPCION=$(fzenity)
 #else
	OPCION=$(zenity --list --hide-header --ok-label="Seleccionar" \
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
		"9" "Ayuda")		
 #fi
#= = = = = = = = = = Función Opciones de la herramienta = = = = = = = = = =
Opciones() {
case $OPCION in
1)
	OPCION1=$(zenity --hide-header --ok-label="Seleccionar" \
	--height=210 --width=300 --list \
	--title "Recovery Temporal" --hide-column 1 \
	--text "Serial de Tablet: $SERIAL\nEmparejado con PC: $HOSTNAME\n`date`" \
	--column "" --column "Opciones: " \
		"1" "TWRP (Tactil)" \
		"2" "ClockworkMod (CWM)" \
		"3" "Regresar al menu") 

	if [ $OPCION1 -eq 1 ]; then
	# TRABAJAR CON LA VARIABLES DE ENTORNO (No todos los sistemas tienen gnome-terminal)
	gnome-terminal --hide-menubar --geometry=70x30 \
	-t "TR10-TOOL - TRABAJANDO" -e "bash -c \"
		echo '## Seleccionado TWRP como Recovery Temporal! ##'
		echo ''
		echo '->> Entrando al directorio RECOVERY_LIST'
		echo '->> Seleccionando TWRP por default'
		echo '->> Reiniciando en modo Droidboot'
			cd RECOVERY_LIST/TWRP
		echo ''
		echo '# >>>>>>>>>>>> IMPORTANTE <<<<<<<<<<<< #'
		echo '# >>>>> NO TOQUE EL DISPOSITIVO <<<<< #'
            $ADB reboot-bootloader && $FASTBOOT getvar all
		echo ''
        	$FASTBOOT flash /tmp/recovery.zip twrp_canaima.zip
		echo '->> Flash TWRP on /tmp/recovery.zip'
		echo ''
		echo '->> Flash recovery launcher on /tmp/recovery.launcher'
		echo ''
            $FASTBOOT flash /tmp/recovery.launcher twrp_canaima.launcher
		echo ''
		echo '->> Iniciando particionado'
		echo ''
        	$FASTBOOT oem start_partitioning
		echo ''
		echo '->> Flash trigger on /system/bin/logcat'
		echo ''
        	$FASTBOOT flash /system/bin/logcat twrp_canaima.trigger
		echo ''
		echo '->> Deteniendo el particionado para iniciar en TWRP'
		echo ''
        	$FASTBOOT oem stop_partitioning
		echo ''
		echo '->> Entrando en TWRP'
		echo ''
		echo 'Presiona <ENTER> para continuar!'
		read\""
			MenuPrincipal
	fi	

	if [ $OPCION1 -eq 2 ]; then
	# TRABAJAR CON LA VARIABLES DE ENTORNO (No todos los sistemas tienen gnome-terminal)
	gnome-terminal --hide-menubar --geometry=70x30 \
	-t "TR10-TOOL - TRABAJANDO" -e "bash -c \"
		echo '## Seleccionado CWM como Recovery Temporal! ##'
		echo ''
		echo '->> Entrando al directorio RECOVERY_LIST'
		echo '->> Seleccionando CWM por default'
		echo '->> Reiniciando en modo Droidboot'
            cd RECOVERY_LIST/CWM
		echo ''
		echo '# >>>>>>>>>>>> IMPORTANTE <<<<<<<<<<<< #'
		echo '# >>>>> NO TOQUE EL DISPOSITIVO <<<<< #'
            $ADB reboot-bootloader && $FASTBOOT getvar all
		echo ''            
            $FASTBOOT flash /tmp/recovery.zip cwm_canaima.zip
		echo '->> Flash CWM on /tmp/recovery.zip'
		echo ''
		echo '->> Flash recovery launcher on /tmp/recovery.launcher'
		echo ''
			$FASTBOOT flash /tmp/recovery.launcher cwm_canaima.launcher
		echo ''
		echo '->> Iniciando particionado'
		echo ''
            $FASTBOOT oem start_partitioning 
		echo ''
		echo '->> Deteniendo el particionado para iniciar en CWM'
		echo ''
            $FASTBOOT flash /system/bin/cp cwm_canaima.trigger
		echo ''
		echo '->> Realizando respaldando'
		echo ''        
            $FASTBOOT oem backup_factory
		echo ''
		echo 'Presiona <ENTER> para continuar!'
		read\""
			MenuPrincipal
	fi	

	if [ $OPCION1 -eq 3 ]; then
			MenuPrincipal
	fi	
;; 

2)
	OPCION2=$(zenity --hide-header --ok-label="Seleccionar" \
	--height=0 --width=300 --list \
	--title "Custom Recovery" --hide-column 1 \
	--text "Serial de Tablet: $SERIAL\nEmparejado con PC: $HOSTNAME\n`date`" \
	--column "" --column "Opciones: " \
		"1" "(TWRP Tactil) Root + Gapps" \
		"2" "Regresar al menu")

	if [ $OPCION2 -eq 1 ]; then
	# TRABAJAR CON LA VARIABLES DE ENTORNO (No todos los sistemas tienen gnome-terminal)
	gnome-terminal --hide-menubar --geometry=70x30 \
	-t "TR10-TOOL - TRABAJANDO" -e "bash -c \"
		echo '## Seleccionado TWRP como Recovery Temporal! ##'
		echo ''
		echo '->> Entrando en el directorio SUPER_SU'
	 		cd SUPER_SU
		echo '->> Copiando super_su-canaima.zip al dispositivo'
			$ADB push -p super_su-canaima.zip /sdcard/
		echo ''
		echo '->> Saliendo del directorio SUPER_SU'
	 		cd ..
		echo '->> Entrando en directorio GAPPS'
     		cd GAPPS
		echo '->> Copiando GAPPS al dispositivo'
			$ADB push -p open_gapps-x86.zip /sdcard/
		echo ''
		echo '->> Saliendo del directorio GAPPS'
	 		cd .. 
		echo '->> Entrando en RECOVERY_LIST'
		echo '->> Reiniciando en modo Droidboot'
     		cd RECOVERY_LIST/TWRP
		echo ''
		echo '# >>>>>>>>>>>> IMPORTANTE <<<<<<<<<<<< #'
		echo '# >>>>> NO TOQUE EL DISPOSITIVO <<<<< #'
			$ADB reboot-bootloader && $FASTBOOT getvar all 
		echo '' 
			$FASTBOOT flash /tmp/recovery.zip twrp_canaima.zip
     	echo ''
		echo '->> Flash TWRP on /tmp/recovery.zip'
		echo '->> Flash recovery launcher on /tmp/recovery.launcher'
		echo ''
			$FASTBOOT flash /tmp/recovery.launcher twrp_canaima.launcher
		echo ''
		echo '->> Iniciando particionado' 
		echo ''
			$FASTBOOT oem start_partitioning
		echo ''
		echo '->> Flash trigger on /system/bin/logcat'
		echo ''
			$FASTBOOT flash /system/bin/logcat twrp_canaima.trigger
		echo ''
		echo '->> Deteniendo el particionado para iniciar en TWRP'
		echo ''
			$FASTBOOT oem stop_partitioning
		echo ''
		echo 'Presiona <ENTER> para continuar!'
		read\""
			MenuPrincipal
	fi

	if [ $OPCION2 -eq 2 ]; then
			MenuPrincipal
	fi
;;

3)
	OPCION3=$(zenity --hide-header --ok-label="Seleccionar" \
	--height=0 --width=300 --list \
	--title "Droidboot/Fastboot" --hide-column 1 \
	--text "Serial de Tablet: $SERIAL\nEmparejado con PC: $HOSTNAME\n`date`" \
	--column "" --column "Opciones: " \
		"1" "Modo Droidboot/Fastboot" \
		"2" "Regresar al menu")

	if [ $OPCION3 -eq 1 ]; then
	# TRABAJAR CON LA VARIABLES DE ENTORNO (No todos los sistemas tienen gnome-terminal)
	gnome-terminal --hide-menubar --geometry=70x30 \
	-t "TR10-TOOL - TRABAJANDO" -e "bash -c \"
		echo '## Seleccionado modo Droidboot/Fastboot! ##'
		echo '->> Entrando en RECOVERY_LIST'
		echo '->> Reiniciando en modo Droidboot'
     		cd RECOVERY_LIST/TWRP
		echo ''
		echo '# >>>>>>>>>>>> IMPORTANTE <<<<<<<<<<<< #'
		echo '# >>>>> NO TOQUE EL DISPOSITIVO <<<<< #'
		$ADB reboot-bootloader && $FASTBOOT getvar all
		echo ''
		echo 'Presiona <ENTER> para continuar!'
		read\""
			MenuPrincipal
	fi

	if [ $OPCION3 = 2 ]; then
			MenuPrincipal
	fi
;;	

4)
	OPCION4=$(zenity --hide-header --ok-label="Seleccionar" \
	--height=0 --width=300 --list \
	--title "Recovery (Nativo)" --hide-column 1 \
	--text "Serial de Tablet: $SERIAL\nEmparejado con PC: $HOSTNAME\n`date`" \
	--column "" --column "Opciones: " \
		"1" "Reiniciar en modo Recovery (Nativo)" \
		"2" "Regresar al menu")

	if [ $OPCION4 -eq 1 ]; then
	# TRABAJAR CON LA VARIABLES DE ENTORNO (No todos los sistemas tienen gnome-terminal)
	gnome-terminal --hide-menubar --geometry=70x30 \
	-t "TR10-TOOL - TRABAJANDO" -e "bash -c \"
		echo '## Seleccionado modo NATIVO! ##'
		echo ''
		echo 'Una vez reiniciado presione la siguiente combinación 1 o 2 veces:'
        echo 'Volumen Up + Volumen Down'
		$ADB reboot recovery
		echo ''
		echo 'Presiona <ENTER> para continuar!'
		read\""
			MenuPrincipal
	fi

	if [ $OPCION4 = 2 ]; then
			MenuPrincipal
	fi
;;	

5)
	OPCION5=$(zenity --hide-header --ok-label="Seleccionar" \
	--height=0 --width=300 --list \
	--title "SHELL" --hide-column 1 \
	--text "Serial de Tablet: $SERIAL\nEmparejado con PC: $HOSTNAME\n`date`" \
	--column "" --column "Opciones: " \
		"1" "Entrar en el Shell" \
		"2" "Regresar al menu")

	if [ $OPCION5 -eq 1 ]; then
	# TRABAJAR CON LA VARIABLES DE ENTORNO (No todos los sistemas tienen gnome-terminal)
	gnome-terminal --hide-menubar --geometry=70x30 \
	-t "TR10-TOOL - TRABAJANDO" -e "bash -c \"
		echo '## Entrando a la SHELL! ##'
		echo '' 
		echo '->> Escribe 'exit' para salir'
        echo -e '\e[1;31m¡Diviértete!'
		$ADB shell
		echo ''
		echo 'Presiona <ENTER> para continuar!'
		read\""
			MenuPrincipal
	fi

	if [ $OPCION5 = 2 ]; then
			MenuPrincipal
	fi
;;	

6)
	OPCION6=$(zenity --hide-header --ok-label="Seleccionar" \
	--height=210 --width=300 --list \
	--title "Bypass Lock" --hide-column 1 \
	--text "Serial de Tablet: $SERIAL\nEmparejado con PC: $HOSTNAME\n`date`" \
	--column "" --column "Opciones: " \
		"1" "Bypass Lock (PATRÓN)" \
		"2" "Bypass Lock (PIN / CONTRASEÑA)" \
		"3" "Regresar al menu")

	if [ $OPCION6 -eq 1 ]; then
	# TRABAJAR CON LA VARIABLES DE ENTORNO (No todos los sistemas tienen gnome-terminal)
	gnome-terminal --hide-menubar --geometry=70x30 \
	-t "TR10-TOOL - TRABAJANDO" -e "bash -c \"
		echo '## Seleccionado Bypass Lock (PATRÓN)! ##'
		echo ''
		echo '->> Iniciando Bypass lock por PATRÓN'
		echo '->> Trabajando con shell del dispositivo'
		echo '->> Eliminando bloqueo'
            $ADB shell su and rm -rf /data/system/gesture.key
		echo ''
		echo '->> Bypass Success!'
		echo '->> Dispositivo listo para ingresar con cualquier patrón...'
		echo ''
		echo 'Presiona <ENTER> para continuar!'
		read\""
			MenuPrincipal
	fi	

	if [ $OPCION6 -eq 2 ]; then
	# TRABAJAR CON LA VARIABLES DE ENTORNO (No todos los sistemas tienen gnome-terminal)
	gnome-terminal --hide-menubar --geometry=70x30 \
	-t "TR10-TOOL - TRABAJANDO" -e "bash -c \"
		echo '## Seleccionado Bypass Lock por (PIN/CONTRASEÑA)! ##'
		echo ''
		echo '->> Iniciando Bypass lock (PIN/CONTRASEÑA)'
		echo '->> Trabajando con Shell del dispositivo'
		echo '->> Eliminando bloqueo'
            $ADB shell su and rm -rf /data/system/password.key
		echo ''
		echo 'Presiona <ENTER> para continuar!'
		read\""
			MenuPrincipal
	fi	

	if [ $OPCION6 -eq 3 ]; then
			MenuPrincipal
	fi
;;	

7)
	OPCION7=$(zenity --hide-header --ok-label="Seleccionar" \
	--height=300 --width=0 --list \
	--title "Multiflash" --hide-column 1 \
	--text "Serial de Tablet: $SERIAL\nEmparejado con PC: $HOSTNAME\n`date`" \
	--column "" --column "Opciones: " \
		"1" "Multi Root" \
		"2" "Multi Gapps" \
		"3" "Root and Gapps" \
		"4" "Multi Zip/Update" \
		"5" "Multi Apk Install" \
		"6" "Regresar al menu")

	if [ $OPCION7 -eq 1 ]; then
			MenuPrincipal
	fi	

	if [ $OPCION7 -eq 2 ]; then
			MenuPrincipal
	fi	
	if [ $OPCION7 -eq 3 ]; then
			MenuPrincipal
	fi
	if [ $OPCION7 -eq 4 ]; then
			MenuPrincipal
	fi
	if [ $OPCION7 -eq 5 ]; then
			MenuPrincipal
	fi
	if [ $OPCION7 -eq 6 ]; then
			MenuPrincipal
	fi
;;	

8)
	rm -f /tmp/InfoTool.txt
	echo '########## TR10-TOOL ##########
== Información ==
	Script escrito en Bash para entornos GNU/Linux
	usando la ultima versión de ADB y FASTBOOT
	del SDK Alone Tools, pensado para ser usado
	en los modelos TR10CS1/TR10RS1 entregadas
	por el estado venezolano.
== Desarrolladores ==
	* Versión Bash
	TSU Erick Carvajal R
	Twitter: @neocarvajal
	Correo: neocarvajal12@gmail.com              
	Facebook: www.facebook.com/neocarvajal
		Repositorio:
		github.com/neocarvajal/TR10-TOOL
	* Versión Zenity
	ING. Wuilmer Bolívar
	Twitter: @WuilmerBolivar
	Correo: el.wuilmer@gmail.com
	Facebook: www.facebook.com/Wuilmer22
		Repositorio: 
		neocarvajal/TR10-TOOL/tree/environment
== Agradecimientos ==
	Team Win Recovery Project TWRP.
	github/omnirom/android_bootable_recovery/
	Usuario vampirefo de la comunidad XDA por 
	el trabajo realizado con los recoverys 
	temporales para los dispositivos 
	Dell Vennue 8 (CWM/TRWP).' >> /tmp/InfoTool.txt

	zenity --ok-label='Aceptar' --height=660 --width=425 --text-info \
	--title 'Acerca de' --filename=/tmp/InfoTool.txt --checkbox='Comprendo!'
			MenuPrincipal
;;

9)
	readme=`dirname $0`/README.md
	zenity --ok-label='Aceptar' --text-info --height=400 --width=650 \
	--title='Ayuda' --filename=$readme
			MenuPrincipal
;;

*)
	zenity --info --text='Desconectando...'
	exit
;;
esac
}
	Opciones
}
MenuPrincipal

    Status API Training Shop Blog About Pricing 

    © 2016 GitHub, Inc. Terms Privacy Security Contact Help 

