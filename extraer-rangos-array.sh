#!/bin/bash
# Extraer un rango de elementos de un arreglo

# Puedes extraer un rango de elementos de un arreglo utilizando la sintaxis de corchetes y los índices de inicio y fin separados por dos puntos ::

numeros=(1 2 3 4 5)
echo "${numeros[@]:1:3}" # imprime "2 3 4"