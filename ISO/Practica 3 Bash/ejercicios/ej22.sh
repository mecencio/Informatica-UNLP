#!/bin/bash

# Declaración inicial
num=(10 3 5 7 9 3 5 4)

# Declaracion de la funcion productoria
productoria() {
  local result=1
  for i in "${num[@]}";
  do
    let result=result*i
  done
  
  echo $result
}

productoria
