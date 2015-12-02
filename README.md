# TR10 TOOL 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Bash Script For TR10CS1/TR10RS1 Intel Atom x86 ( Root + Gapps and Temp-Custom Recovery Tools) 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Advertencia
___________

Esta herramienta fue desarrollada con fines educativos, cada persona es responsable de su uso y de los posibles daños ocasionados a los equipos con los que se utilice el script !

Este script fue escrito en Bash para entornos Gnu/Linux usando la ultima versión de adb y fastboot del sdk alone tools para Gnu/Linux. Script pensado para ser utilizado con los modelos TR10CS1 y TR10RS1 de intel entregadas por el estado venezolano a estudiantes universitarios. #CanaimaUniversitario

# Pasos para utilizar la herramienta	
Usualmente puede pasar que en Gnu/Linux (dependiendo de la distribución) no reconozca de buenas a primeras tu dispositivo y por tal razón sea imposible que pueda comunicarse con el vía adb o fastboot. Si este es tu caso tendrás que hacer ciertas cosas antes de empezar a utilizar esta herramienta (Si este no es tu caso ve directo a Preparando el dispositivo).

## Preparando el sistema :	

Este procedimiento seria el equivalente a instalar los drivers en un sistema privativo como Windows para poder reconocer el dispositivo, estos son los pasos a seguir :

	1 - Conectar el dispositivo al Pc Gnu/Linux y en un terminal entrar como root :
		![TerminalRoot](https://raw.githubusercontent.com/neocarvajal/TR10-TOOL/master/IMAGES/1.png)		

    2 - Listar los dispositivos conectados via USB y copiar el vendor_id 
  		(podria solo mostrar hasta el ID resaltado sin el nombre de la compañia):
		https://raw.githubusercontent.com/neocarvajal/TR10-TOOL/master/IMAGES/2.png

	3 - Crear una regla en la siguiente ruta /etc/udev/rules.d/51-android.rules (si ya existe ve al siguiente paso).
		https://raw.githubusercontent.com/neocarvajal/TR10-TOOL/master/IMAGES/3.png

	4 - Con tu editor de texto preferido abre el archivo creado(/etc/udev/rules.d/51-android.rules) 	copia y pega esta cadena en el archivo :
	
		SUBSYSTEM=="usb", ATTRS{idVendor}=="",ATTRS{idProduct}=="", MODE="0666"

  		En el mismo orden que aparece el ID del dispositivo en el segundo paso, reemplazalos en esta cadena en el mismo orden y guarda los cambios. En este caso seria:

		https://raw.githubusercontent.com/neocarvajal/TR10-TOOL/master/IMAGES/6.png

	5 - En el terminal reinicia el servicio udev :
		https://raw.githubusercontent.com/neocarvajal/TR10-TOOL/master/IMAGES/7.png

## Preparando el dispositivo :	
	
	1 - Entrar  en Configuración/Acerca de la tablet/ y precionar varias veces en el Numero de Compilación.	
	https://raw.githubusercontent.com/neocarvajal/TR10-TOOL/master/IMAGES/4.png

	2 -	Entrar en Configuración/Menú desarrollador/Depuración USB.	
	https://raw.githubusercontent.com/neocarvajal/TR10-TOOL/master/IMAGES/5.png

-----------------------------------------------------------------------------------------------

#Configurando TR10-TOOL
1 - Descargar el zip/tar.gz de la repo y descomprimir.

2 - Descargar gapps (.zip) y ubicarlo en la carpeta GAPPS con el nombre que tiene el archivo.txt en el mismo directorio. Link descarga GAPPS : http://opengapps.org/ (Android x86 4.4 / Cualquier variante).

3 - Activar la depuración USB en el dispositivo y aceptar como RSA de confianza (seǵun sea el caso).

4 - Ejecutar el script TR10-TOOL.sh de la siguiente manera : ./TR10-TOOL.sh

5 - Mientras no tengas las gapps no ejecutar la función 1 (no hay problemas solo mostrara el error de que no encuentra el fichero).

# Video Guía
https://www.youtube.com/watch?v=Cm7QASoZeWk

#Desarrollador
T.S.U Erick Carvajal R. Estudiante universitario en la UPTOS "Clodosbaldo Russiían". Usuario Gnu/Linux desde 2009.

# Meta
Crear una herramienta con más opciones y mucho más universal como si se tratara de una Suite tipo (kies) que permita gestionar el dispositivo facilmente en tareas comunes(respaldos, copiar archivos entre un pc y el dispositivo entre otros), manteniendo las opciones "avanzadas" como flashear Cunstom Recovery.

# Soporte/Contacto
Para discuciones en cuanto al desarrollo y mejoras del script puedes visitar el foro : http://tabletcanaima.com.ve y adicionalmente puedes encontrarme en #Twitter como @neocarvajal

