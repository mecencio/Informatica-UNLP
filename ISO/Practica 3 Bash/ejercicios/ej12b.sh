#!/bin/bash

if [ $# -ne 2 ]
then
  echo "Error: Debe ingresar dos números como parámetros."
  exit 1
fi

num1=$1
num2=$2

suma=$((num1 + num2))
resta=$((num1 - num2))
multiplicacion=$((num1 * num2))

echo "La suma de $num1 y $num2 es: $suma"
echo "La resta de $num1 y $num2 es: $resta"
echo "La multiplicacion de $num1 y $num2 es: $multiplicacion"

if [ $num1 -gt $num2 ]
then
  echo "$num1 es mayor que $num2"
elif [ $num1 -lt $num2 ]
then
  echo "$num2 es mayor que $num1"
else
  echo "$num1 y $num2 son iguales."
fi
