#!/bin/bash

# Solicitar al usuario que introduzca números separados por espacios
echo "Introduce los números separados por un espacio:"
read -r numeros_input

# Convertir la cadena de entrada en un arreglo
IFS=' ' read -r -a numeros <<< "$numeros_input"

# Ordenar numéricamente
mapfile -t numeros_ordenados < <(echo "${numeros[@]}" | tr ' ' '\n' | sort -n)

# Imprimir los números ordenados
echo "Los números ordenados son:"
echo "${numeros_ordenados[@]}"

# Resultado por consola:
# <▸> ~/D/bash-rangos on main ✓ ./ordenar-array-input.sh                   
# Introduce los números separados por un espacio:
# 3 5 6 8 8 5 65 56 76 43 54 345 54 3454 
# Los números ordenados son:
# 3 5 5 6 8 8 43 54 54 56 65 76 345 3454
# <▸> ~/D/bash-rangos on main ✓ 