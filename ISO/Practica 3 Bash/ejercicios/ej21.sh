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

push 1
push 2
push 3
push 4
push 5
push 6
push 7
push 8
push 9
push 0	
pop
pop
pop
length
print
