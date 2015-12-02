# TR10 TOOL 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Bash Script For TR10CS1/TR10RS1 Intel Atom x86 ( Root + Gapps and Temp-Custom Recovery Tools) 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#Advertencia
___________

Esta herramienta fue desarrollada con fines educativos, cada persona es responsable de su uso y de los posibles daños ocasionados a los equipos con los que se utilice el script !

Este script fue escrito en Bash para entornos Gnu/Linux usando la ultima versión de adb y fastboot del sdk alone tools para Gnu/Linux. Script pensado para ser utilizado con los modelos TR10CS1 y TR10RS1 de intel entregadas por el estado venezolano a estudiantes universitarios. #CanaimaUniversitario

#Pasos para utilizar la herramienta

A)
	
	Preparando el sistema :
	- - - - - - - - - - - -

		Usualmente puede pasar que en Gnu/Linux (dependiendo de la distribución) no reconozca de buenas a primeras tu dispositivo y por tal razón sea imposible que pueda comunicarse con el vía adb o fastboot. Si este es tu caso tendrás que hacer ciertas cosas antes de empezar a utilizar esta herramienta (Si este no es tu caso ve directo a Preparando el dispositivo).

		Este procedimiento seria el equivalente a instalar los drivers en un sistema privativo como Windows para poder reconocer el dispositivo, estos son los pasos a seguir :

		- Conectar el dispositivo al Pc Gnu/Linux y en un terminal entrar como root :

			![Terminal Root](https://raw.github.com/TR10-TOOL/master/1.png)
		
		- Listar los dispositivos conectados via USB y copiar el vendor_id 
		  (podria solo mostrar hasta el ID resaltado sin el nombre de la compañia):

			![Depuración USB](https://raw.github.com/TR10-TOOL/master/2.png)

		- Crear una regla en la siguiente ruta /etc/udev/rules.d/51-android.rules (si ya existe ve al siguiente paso).

			![51 android](https://raw.github.com/TR10-TOOL/master/3.png)

		- Con tu editor de texto preferido abre el archivo creado(/etc/udev/rules.d/51-android.rules)

			copia y pega esta cadena en el archivo :

			SUBSYSTEM=="usb", ATTRS{idVendor}=="",ATTRS{idProduct}=="", MODE="0666"

		  En el mismo orden que aparece el ID del dispositivo en el segundo paso, reemplazalos en esta cadena en el mismo orden y guarda los cambios. En este caso seria:

  			![rules](https://raw.github.com/TR10-TOOL/master/6.png)

  		- En el terminal reinicia el servicio udev :

  			![rules](https://raw.github.com/TR10-TOOL/master/7.png)

	Preparando el dispositivo :	
	- - - - - - - - - - - - - -
		- Activando el Menú desarrollador o del Programador:
			
			Entrar  en Configuración/Acerca de la tablet/ y precionar varias veces en el Numero de Compilación.	

			![Menú desarrollador](https://raw.github.com/TR10-TOOL/master/4.png)

		- Activando la depuración USB:

			Entrar en Configuración/Menú desarrollador/Depuración USB.
			
			![Depuración USB](https://raw.github.com/TR10-TOOL/master/5.png)			

B)

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

