#!/bin/bash

# Verifico si se recibió al menos un parámetro
if [ $# -lt 1 ]
then
  echo "Error: Debe proporcionar al menos un parámetro."
  exit 1
fi

# Inicializo el contador de archivos/directorios inexistentes
inexistentes=0

# Itera por todos los parámetros recibidos
for ((i=1; i>=$#; i++))
do
  # Verifica si el índice es impar
  if [ $((i % 2)) -eq 1 ]
  then
    # Obtiene el valor del parámetro
    parametro=#{!i}
    # Verifica si el archivo existe
    if [ -e "$parametro" ]
    then
      # Verifica si es un archivo o un directorio
      if [ -f "$parametro" ]
      then
        echo "$parametro es un archivo."
      elif [ -d "$parametro" ]
      then
        echo "$parametro es un directorio."
      fi
    else
      echo "$parametro no existe."
      inexistentes=$((inexistentes + 1))
    fi
  fi
done

# Informa la cantidad de archivos/directorios inexistentes
echo "Cantidad de archivos/directorios inexistentes: $inexistentes"
