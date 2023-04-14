#!/bin/bash


# Eliminar elementos de un arreglo

# Además de la opción unset que ya has utilizado, puedes eliminar elementos de un arreglo utilizando la sintaxis unset junto con la posición del elemento que deseas eliminar:

# ERROR
# numeros=(1 2 3 4 5)
# unset numeros[2] # elimina el elemento "3"
# echo "${numeros[@]}" # imprime "1 2 4 5"


# Eliminar elementos de un arreglo

# Además de la opción unset que ya has utilizado, puedes eliminar elementos de un arreglo utilizando la sintaxis unset junto con la posición del elemento que deseas eliminar:

numeros=(1 2 3 4 5)
echo "${numeros[@]}" # imprime "1 2 4 5"
unset numeros[2] # elimina el elemento "3"
echo "${numeros[@]}" # imprime "1 2 4 5"
