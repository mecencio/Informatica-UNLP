#!/bin/bash

# Declaro los vectores
vector1=(1 80 65 35 2)
vector2=(5 98 3 41 8)

# Controlo que ambos vectores tengan la misma longitud
if [ ${#vector1[@]} -ne ${#vector2[@]} ]
then
  echo "Error: Los vectores deben tener el mismo tamaño."
  exit 1
fi

# Resuelvo lo solicitado
for ((i=0; i<${#vector1[@]}; i++))
do
  echo "La suma de los elementos de la posición $i de los vectores es $((vector1[$i] + vector2[$i]))"
done
