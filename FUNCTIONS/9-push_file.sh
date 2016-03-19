#!/bin/bash
#9-push_file.sh
#
# Este script selecciona un archivo del pc en modo gráfico desde Zenity
# para copiarlo al dispositivo
#
#~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY TR10 CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 26/12/2015
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# function push_file {
#     clear   
#     # Info Dispositivo  -------------------------------------------------
#     echo " "
#     echo "##############################################"
#     echo -e "\t\e[2;34;1mINFORMACIÓN DEL DISPOSITIVO\e[m"
#     echo "#                                            #"
#     echo "  Emparejado con Pc $HOSTNAME                 "
#     echo "#                                            #"
#     echo "  Serial: $SERIAL                             "
#     echo "#                                            #"
#     echo "  `date`                                      "
#     echo "#                                            #"
#     echo "##############################################"
#     echo " "   
    
#     echo " ¿Desea Empezar o Regresar?"
#     echo "- - - - - - - - - - - - - - - - - - - - - - - - "
#     echo " 1 - Buscar archivo"
#     echo " 2 - <-- MENÚ PRINCIPAL"                
#     echo "- - - - - - - - - - - - - - - - - - - - - - - - -"
#     read -p "Seleccione una opción: " opcion    
#     # conections_tr10_tool
#     # if [ $ESTADO == $CONECTADO ]; then
#         if [ $opcion -eq 1 ]; then
            
#             FILE=`zenity --file-selection --title="Selecciona un archivo para enviar al dispositivo"`

#             case $? in
#                 0)
#                     zenity --warning --no-wrap --no-markup --title=".: TR10-TOOL :." \                    
#                     --text="Copiando archivo al dispositivo... 
#                     \n `$ADB push -p \"$FILE\" /sdcard/`."                    
#                 ;;
                
#                 1)
#                     echo "Ningún archivo seleccionado"
#                 ;;
               
#                -1)
#                     echo "Ha ocurrido un error inesperado";
#                     echo " ";
#                     zenity --error --text="Imposible copiar el archivo \"$FILE\" en el dispositivo \"$SERIAL\" ";                    
#                 ;;
#             esac
#         else
#             echo "Regresando al menú principal"
#         fi
#     # else
#         # reconect_adb_tr10_tool
#         # push_file
#     # fi
# }