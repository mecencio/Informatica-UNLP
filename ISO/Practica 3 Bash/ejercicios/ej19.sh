#!/bin/bash

echo "MENU DE COMANDOS"
echo "01. Evaluacion de expresiones (sin parámetros)"
echo "02. Evaluacion de expresiones (2 parámetros)"
echo "03. Evaluación de expresiones (3 parámetros)"
echo "04. Visualizar 100 números y sus cuadrados"
echo "05. Ejercicio 13 b: Listar, donde estoy y quien está"
echo "06. Informar si existe un archivo (1 parámetro)"
echo "07. Renombrar archivos (-a/-b CADENA)"
echo "08. Contar archivos segun extensión (1 parámetro)"
echo "09. Reemplazar mayus y minus"
echo "10. Verificar si un usuario se ha logueado (1 parámetro)"
echo ""
echo "Ingrese la opcion a ejecutar: "
read opcion

case $opcion in
  "01")
    ./ej12a.sh
    ;;
  "02")
    if [ $# -ne 2 ]; then
      echo "Error: Debe ingresar 2 parámetros."
      exit 1
    fi
    ./ej12b.sh $1 $2
    ;;
  "03")
    if [ $# -ne 3 ]; then
      echo "Error: Debe ingresar 3 parámetros."
      exit 1
    fi
    ./ej12c.sh $1 $2 $3
    ;;
  "04")
    ./ej13a.sh
    ;;
  "05")
    ./ej13b.sh
    ;;
  "06")
    if [ $# -eq 0 ]; then
      echo "Error: Debe ingresar 1 parámetro."
      exit 1
    fi
    ./ej13c.sh $1
    ;;
  "07")
    if [ $# -ne 2 ]; then
      echo "Error: Debe ingresar 2 parámetros."
      exit 1
    fi
    ./ej14.sh $1 $2
    ;;
  "08")
    if [ $# -eq 0 ]; then
      echo "Error: Debe ingresar 1 parámetro."
      exit 1
    fi
    ./ej16.sh $1
    ;;
  "09")
    ./ej17.sh
    ;;
  "10")
    if [ $# - eq 0 ]; then
      echo "Error: Debe ingresar 1 parámetro."
      exit 1
    fi
    ./ej18.sh $1
    ;;
  *)
    echo "Opcion no válida"
    ;;
esac

echo "Programa 19 finalizado..."
exit 0
