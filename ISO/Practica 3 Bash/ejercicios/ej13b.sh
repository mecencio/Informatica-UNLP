#!/bin/bash

echo "Elige una opcion:"
echo "1) Listar"
echo "2) DondeEstoy"
echo "3) QuienEsta"
read opcion

case $opcion in
  1)
    ls
    ;;
  2)
    pwd
    ;;
  3)
    who
    ;;
  *)
    echo "Opción inválida."
    ;;
esac
