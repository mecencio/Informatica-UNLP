#!/bin/bash

if [ $# -ne 3 ]
then
  echo "Error: Debe ingresar 3 parámetros."
  exit 1
fi

operacion=$1
num1=$2
num2=$3

case $operacion in
  "+")
    resultado=$(($num1 + $num2))
    ;;
  "-")
    resultado=$(($num1 - $num2))
    ;;
  "*")
    resultado=$(($num1 * $num2))
    ;;
  "%")
    if [ $num2 -eq 0 ]
    then
      echo "Error: No se puede dividir por cero"
      exit 1
    fi
    resultado=$(($num1 / $num2))
    ;;
  *)
    echo "Error: operación no válida. Las operaciones válidas son +, -, *, %."
    exit 1
    ;;
esac

echo "El resultado de $num1 $operacion $num2 es: $resultado"
