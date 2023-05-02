#!/bin/bash

if [ $# -ne 1 ]
then
  echo "Error: Debe ingresar el nombre de un archivo como parámetro."
  exit 1
fi

nombre_archivo=$1

if [ -e $nombre_archivo ]
then
  if [ -d $nombre_archivo ]
  then
    echo "$nombre_archivo es un directorio."
  elif [ -f $nombre_archivo ]
  then
    echo "$nombre_archivo es un archivo."
  else
    echo "$nombre_archivo existe pero no es ni un directorio ni un archivo."
  fi
else
  echo "$nombre_archivo no existe. Creando directorio con ese nombre..."
  mkdir $nombre_archivo
fi
