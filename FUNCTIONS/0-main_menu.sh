# Menu de opciones -------------------------------------------------
DIR=$(pwd)
function Main(){
{ 
select=$(zenity --cancel-label="Salir" --height=380 --width=300 --list --title ".: MENU PRINCIPAL :." --hide-column 1 --text "Serial de Tablet: $SERIAL\nEmparejado con PC: $HOSTNAME\n`date`" --column "" --column "Opciones: " \
"1" "Reiniciar en Recovery Temporal" \
"2" "Recovery Temporal + Root + Gapps" \
"3" "Reiniciar en Droidboot (Fastboot)" \
"4" "Reiniciar en Recovery (Nativo)" \
"5" "Shell del dispositivo" \
"6" "Bypass Lock (ROOT)" \
"7" "Créditos" \
"8" "Ayuda")
	if [ $select = 1 ]; then
		reboot_temp_recovery
	fi
	if [ $select = 2 ]; then
		temp_recovery_root_gapps           
	fi
	if [ $select = 3 ]; then
		reboot_droidboot
	fi	
	if [ $select = 4 ]; then
		reboot_native_recovery
	fi	
	if [ $select = 5 ]; then
		enter_shell
	fi	
	if [ $select = 6 ]; then
		bypass_lock
	fi	
if [ $select = 7 ]; then
rm -f /tmp/InfoTool.txt
echo '== Información ==
Herramienta fue desarrollada con fines educativos, 
cada persona es responsable de su uso.  

== Desarrollador ==
T.S.U Erick Carvajal R
Nick: neocarvajal                              

=== Contacto ===                                              
Correo electronico: neocarvajal12@gmail.com              
Facebook: www.facebook.com/neocarvajal
Twitter: @neocarvajal

== Desarrollo ==
Versión 1.0.0
Repositorio original:
github.com/neocarvajal/TR10-TOOL

== Colaboradores ==
ING. Wuilmer Bolívar
Twitter: @WuilmerBolivar
Facebook: www.facebook.com/Wuilmer22
Repositorio alternativo: 
github.com/WuilmerBolivar/TR10-TOOL' >> /tmp/InfoTool.txt
About=`zenity --cancel-label="Salir" --height=660 --width=425 --text-info --title "Acerca de..." --filename=/tmp/InfoTool.txt --checkbox='Ya he leído todo.'`
fi	
if [ $select = 8 ]; then
	Readme=`dirname $0`/README.md
	Archivo=`zenity --cancel-label="Salir" --text-info --height=400 --width=650 --title="Ayuda" --filename=$Readme`
fi	
}
}
