#!/bin/bash

# Ordenar un arreglo

# Puedes ordenar un arreglo utilizando el comando sort junto con la opción -n para ordenar numéricamente y -r para ordenar en orden descendente:

# bash

numeros=(5 1 3 2 4)

# Ordena numéricamente
mapfile -t numeros_ordenados < <(echo "${numeros[@]}" | tr ' ' '\n' | sort -n)
echo "${numeros_ordenados[@]}" # imprime "1 2 3 4 5"

# Ordena numéricamente en orden descendente
mapfile -t numeros_ordenados_desc < <(echo "${numeros[@]}" | tr ' ' '\n' | sort -nr)
echo "${numeros_ordenados_desc[@]}" # imprime "5 4 3 2 1"
