#!/bin/bash

for file in *; do
  echo $(echo $file | tr [a-z][A-Z] [A-Z][a-z] | tr -d aA)
done
