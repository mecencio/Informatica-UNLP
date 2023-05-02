#!/bin/bash

# Defino el arreglo
nums=(1 2 2 3 4)

# Defino un contador para los números impares
contador=0

# Defino la estrutura para resolver el inciso
for i in ${nums[@]}
do
  if [ $((i % 2)) -eq 0 ]
  then
    echo $i
  else
    let contador++
  fi
done

echo "Cantidad de números impares: $contador"
