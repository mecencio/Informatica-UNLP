#!/bin/bash

# Definir la pila como arreglo
pila=()

# Definir la función push
push() {
  pila+=("$1")
}

# Definir la función pop
pop() {
  if [ ${#pila[@]} -gt 0 ]
  then
    unset pila[${#pila[@]}-1]
  fi
}

# Definir la función length
length() {
  echo ${#pila[@]}
}

# Definir la función print
print() {
  for elemento in "${pila[@]}"
  do
    echo $elemento
  done
}
