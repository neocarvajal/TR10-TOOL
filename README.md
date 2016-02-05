![by @neocarvajal](https://raw.githubusercontent.com/neocarvajal/TR10-TOOL/master/IMAGES/TR10-TOOL-BANNER.png "TR10-TOOL BANNER")

# Chat Desarrolladores 
[![Join the chat at https://gitter.im/neocarvajal/TR10-TOOL](https://badges.gitter.im/neocarvajal/TR10-TOOL.svg)](https://gitter.im/neocarvajal/TR10-TOOL?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

# Advertencia
Esta herramienta fue desarrollada con fines educativos, cada persona es responsable de su uso y de los posibles daños ocasionados a los equipos con los que se utilice el script !

# Información
Este script fue escrito en Bash para entornos Gnu/Linux usando la ultima versión de adb y fastboot del sdk alone tools para Gnu/Linux. Script pensado para ser utilizado con los modelos TR10CS1 y TR10RS1 de intel entregadas por el estado venezolano a estudiantes universitarios. #CanaimaUniversitario

# Funciones Disponibles
1. - Recovery temporal + Root + Gapps 	(Copia archivo Super_SU y Gapps | Entra en recovery temporal TWRP)
2. - Reiniciar en Recovery Temporal 	(TWRP/CWM) 
3. - Reiniciar en Droidboot (Fastboot)  (Bootloader/Fastboot)
4. - Reiniciar en Recovery (Nativo)		(Recovery Mode)
5. - Entrar en el shell del dispositivo (Un pequeño gran mundo en tu dispositivo)
6. - Bypass Lock 						(Desbloquear dispositivo por PIN/CONTRASEÑA/PATRÓN)

# Pasos para utilizar la herramienta
- - - - - - - - - - - - - - - - - - - - - - - - -
realizar todos los pasos como super usuario
- - - - - - - - - - - - - - - - - - - - - - - - -
Usualmente puede pasar que en Gnu/Linux (dependiendo de la distribución) no reconozca de buenas a primeras tu dispositivo y por tal razón sea imposible que pueda comunicarse con el vía adb o fastboot. Si este es tu caso tendrás que hacer ciertas cosas antes de empezar a utilizar esta herramienta (Si este no es tu caso ve directo a Preparando el dispositivo).

## Preparando el sistema
Este procedimiento seria el equivalente a instalar los drivers en un sistema privativo como Windows para poder reconocer el dispositivo, estos son los pasos a seguir:

1. Conectar el dispositivo al Pc Gnu/Linux y en un terminal entrar como root:
	
   ![by @neocarvajal](https://raw.githubusercontent.com/neocarvajal/TR10-TOOL/master/IMAGES/1.png "Permisos root en terminal")

2. Listar los dispositivos conectados vía USB y copiar el vendor_id 
	(podria solo mostrar hasta el ID resaltado sin el nombre de la compañía).

   ![by @neocarvajal](https://raw.githubusercontent.com/neocarvajal/TR10-TOOL/master/IMAGES/2.png "Listar dispositivos con lsusb")

3. Crear una regla en la siguiente ruta /etc/udev/rules.d/51-android.rules (si ya existe el archivo ve al siguiente paso).

   ![by @neocarvajal](https://raw.githubusercontent.com/neocarvajal/TR10-TOOL/master/IMAGES/3.png "Crear regla udev")

4. Con tu editor de texto preferido abre el archivo creado(/etc/udev/rules.d/51-android.rules)
Copia y pega esta cadena en el archivo:

 #####`SUBSYSTEM=="usb", ATTRS{idVendor}=="",ATTRS{idProduct}=="", MODE="0666"`

	En el mismo orden que aparece el ID del dispositivo en el paso 2, 
	reemplazalos en esta cadena respectivamente (idVendor | idProduct) y guarda los cambios:

   ![by @neocarvajal](https://raw.githubusercontent.com/neocarvajal/TR10-TOOL/master/IMAGES/6.png "Agregar idVendor y idProduct")

5. En el terminal reinicia el servicio udev:
	
   ![by @neocarvajal](https://raw.githubusercontent.com/neocarvajal/TR10-TOOL/master/IMAGES/7.png "Reiniciar servicio UDEV")

## Preparando el dispositivo
1. Entrar en Configuración/Acerca de la tablet/ y presionar varias veces en el Numero de Compilación:
	
   ![by @neocarvajal](https://raw.githubusercontent.com/neocarvajal/TR10-TOOL/master/IMAGES/4.png "Activar menú programador")

2. Entrar en Configuración/Menú desarrollador/Depuración USB:
	
   ![by @neocarvajal](https://raw.githubusercontent.com/neocarvajal/TR10-TOOL/master/IMAGES/5.png "Activar depuración USB")

3. Aceptar los permisos Depuración USB (huella digital) al ejecutar el script y conectar la tablet al pc:
   ![by @neocarvajal](https://raw.githubusercontent.com/neocarvajal/TR10-TOOL/master/IMAGES/8.png "Huella digital")
-----------------------------------------------------------------------------------------------

# Configurando TR10-TOOL
1. Descargar el zip/tar.gz de la repo y descomprimir

2. Descargar gapps (.zip) y ubicarlo en la carpeta GAPPS con el nombre que tiene el archivo.txt
 en el mismo directorio. Link descarga GAPPS http://opengapps.org/ (Android x86 4.4 / Cualquier variante)

3. Activar la depuración USB en el dispositivo y aceptar como RSA de confianza (seǵun sea el caso)

4. Ejecutar el script TR10-TOOL.sh de la siguiente manera  ./TR10-TOOL.sh

5. Mientras no tengas las gapps no ejecutar la función 1 (no hay problemas solo mostrara 
	el error de que no encuentra el fichero).

# Video Guía (editando video nuevo...)
https://www.youtube.com/watch?v=Cm7QASoZeWk

# Desarrollador
T.S.U Erick Carvajal R. Estudiante universitario en la UPTOS "Clodosbaldo Russiían". Usuario Gnu/Linux desde 2009.

# Meta
Crear una herramienta con más opciones y mucho más universal como si se tratara de una "Suite" que permita gestionar diferentes dispositivos en tareas comunes fácilmente (respaldos, copiar archivos entre un pc y el dispositivo, entre otros), manteniendo las opciones "avanzadas" como flashear Temp Recovery

# Agradecimientos
1. Team Win Recovery Project [TWRP][] (repositorio official).

[TWRP]: https://github.com/omnirom/android_bootable_recovery/

2. Usuario [vampirefo][] miembro de la comunidad *XDA* por el trabajo realizado con los recovery's temporales para los dispositivos Dell Vennue 8 (CWM/TRWP). 

[vampirefo]: http://forum.xda-developers.com/search.php?searchid=397303595

# Soporte/Contacto
Para discusiones en cuanto al desarrollo y mejoras del script puedes visitar el foro : http://tabletcanaima.com.ve en la sección desarrollo y adicionalmente puedes encontrarme en #Twitter como @neocarvajal
