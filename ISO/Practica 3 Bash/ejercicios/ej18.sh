#!/bin/bash

# Verifico que se haya pasado el usuario por parámetro
if [ $# -eq 0 ]
then
  echo "Error: Debe pasar un usuario por parámetro."
  exit 1
fi

while true
do
  if who | grep $1
  then
    echo "Usuario $1 logueado en el sistema."
    break
  fi
  sleep 10
done
