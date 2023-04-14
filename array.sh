#!/bin/bash

# Arreglo e Iteración

numeros=(1 2 3 4 5 6 7 8) # elementos diferenciados por espacios
nombres=("juan" "pedro" "luffy" "goku" "naruto")
rangos=({A..Z} {1..30})

echo "===== IMPRIMIR  VALORES ==="

echo "${numeros[@]}"
echo "${nombres[@]}"
echo "${rangos[@]}"

echo "== Tamaño arreglos =="

echo "Tamaño de numeros: ${#numeros[@]}" # sintaxis para contar el número de elementos del arreglo
echo "Tamaño de nombres: ${#nombres[@]}"
echo "Tamaño de rangos: ${#rangos[*]}"

echo "=== Elemento de arreglo ==="

echo "Elemento numero 3 del arreglo numeros: ${numeros[2]}"
echo "Elemento numero 4 del arreglo nombres: ${nombres[3]}"
echo "Elemento numero 28 del arreglo numeros: ${rangos[27]}"

echo "=== Manipular arreglos ==="

unset 'numeros[0]' # elimina el elemento de esa posición

echo "Numeros: ${numeros[*]}"

numeros[0]=1

echo "Numeros: ${numeros[*]}"

echo "===== ITERACION FOR ========"

for num in "${numeros[@]}"; do # for each
    echo "Numero: $num"
done

echo "==============================="

for ((i = 0; i < ${#numeros[@]}; i++)); do
    echo "Numero: ${numeros[i]}"
done
