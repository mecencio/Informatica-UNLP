#!/bin/bash

if [ $# -ne 3 ]
then
  echo "Error: debes ingresar el directorio, la opción (-a o -b) y la cadena como parámetros."
  exit 1
fi

directorio=$1
opcion=$2
cadena=$3

if [ ! -d $directorio ]
then
  echo "Error: El directorio $directorio no existe."
  exit 1
fi

for archivo in $directorio/*
do
  if [ -f $archivo ]
  then
    nombre_archivo=$(basename $archivo)
    case $opcion in
      "-a")
        nuevo_nombre="$nombre_archivo$cadena"
        ;;
      "-b")
        nuevo_nombre="$cadena$nombre_archivo"
        ;;
      *)
        echo "La opción ingresada no es válida. Las opciones válidas son -a y -b."
        exit 1
      ;;
    esac
    mv $archivo $directorio/$nuevo_nombre
  fi
done
