#!/bin/bash

# Creo un arreglo con todos los usuarios del grupo "users"
usuarios=($(getent group users | cut -d: -f4 | tr "," " "))

# Verifico si hay opciones en la linea de comandos
while getopts "b:li" opt
do
  case $opt in
    b)
      # Devuelve el elemento en el índice especidicado si existe
      if [ $OPTARG -ge 0 ] && [ $OPTARG -lt ${#usuarios[@]} ]
      then
        echo ${usuarios[$OPTARG]}
      else
        echo "Error: índice inválido."
      fi
      ;;
    l)
      # Devuelve la longitud del arreglo
      echo ${#usuarios[@]}
      ;;
    i)
      # Imprime todos los elementos del arreglo
      for usuario in "${usuarios[@]}"
      do
        echo $usuario
      done
      ;;
    \?)
      echo "Opción inválida: -$OPTARG" >&2
      ;;
  esac
done

# getopts es un comando de Bash que se utiliza para procesar opciones en la línea de comandos. En este caso, getopts "b:li" opt procesa las opciones -b, -l e -i. La opción -b requiere un argumento adicional (indicado por el : después de la b), mientras que las opciones -l e -i no requieren argumentos adicionales.

# El comando getopts se utiliza dentro de un bucle while para procesar cada opción en la línea de comandos. Cada vez que se encuentra una opción, se asigna a la variable opt y se ejecuta el código dentro del case correspondiente.

# $OPTARG es una variable especial en Bash que se utiliza junto con el comando getopts. Cuando se procesa una opción que requiere un argumento adicional (como la opción -b en el script que te proporcioné), getopts asigna el valor del argumento a la variable $OPTARG.

# Por ejemplo, si ejecutas el script con la opción -b 3, getopts procesará la opción -b y asignará el valor 3 a la variable $OPTARG.

