#!/bin/bash

# Verifico si se proporcionó un argumento
if [ $# -eq 0 ]
then
  echo "Error: Debe proporcionar una extensión como argumento."
  exit 1
fi

# Buscar archivos con la extensión proporcinoada y contarlos
find . -type f -name "*.$1" -printf "%u\n" | sort | uniq -c > reporteEj16.txt

# Imprimir mensaje de éxito.
echo "Se ha generado el archivo reporte.txt con el número de archivos que tienen la extensión .$1 por usuario"
