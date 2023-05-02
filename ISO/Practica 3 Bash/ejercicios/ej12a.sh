#!/bin/bash
num1=a
num2=a

# Pedir que ingrese el primer número
while ! echo "$num1" | grep -qE '^[0-9]+$'
do
  echo "Ingrese el primer numero: "
  read num1
  if ! echo "$num1" | grep -qE '^[0-9]+$'; then
    echo "Recuerde que solo puede ingresar numeros"
  fi
done

# Pedir que ingrese el segundo número
while ! echo "$num2" | grep -qE '^[0-9]+$'
do
  echo "Ingrese el segundo numero: "
  read num2
  if ! echo "$num2" | grep -qE '^[0-9]+$'; then
    echo "Recuerde que solo puede ingresar numeros"
  fi
done

# Resultados
suma=$((num1 + num2))
resta=$((num1 - num2))
multiplicacion=$((num1 * num2))

echo "La suma de $num1 y $num2 es: $suma"
echo "La resta de $num1 y $num2 es: $resta"
echo "La multiplicación de $num1 y $num2 es: $multiplicacion"

if [ $num1 -gt $num2 ]; then
  echo "El primer numero es mayor"
else
  if [ $num1 -lt $num2 ]; then
    echo "El segundo numero es mayor"
  else
    echo "Ambos numeros son iguales"
  fi
fi
