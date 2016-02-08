#!/bin/bash
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Función que establece el compartamiento de la barra de progreso
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY TR10 CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 03/12/2015
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# COLABORADOR EN VERSIÓN 2.0.0 CON ENTORNO GRAFICO UTILIZANDO ZENITY
#
# Developer  : Wuilmer Bolivar
# Contact    : http://twitter.com/wuilmerbolivar && http://fb.com/wuilmer22
# Date       : 27/01/2016
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#= = = = = = = = = = Función de la barra de progreso = = = = = = = = = =
ftiming() {
	for i in `seq 1 100`
 do
    echo "$i"
    sleep 0.10
done
}
