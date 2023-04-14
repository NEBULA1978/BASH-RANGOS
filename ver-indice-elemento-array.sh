#!/bin/bash

# Obtener el índice de un elemento en un arreglo

# Puedes obtener el índice de un elemento en un arreglo utilizando un bucle for y la sintaxis de corchetes para comparar cada elemento del arreglo con el elemento que estás buscando:

# bash

numeros=(1 2 3 4 5)
buscar=4
for i in "${!numeros[@]}"; do
    if [[ "${numeros[$i]}" = "${buscar}" ]]; then
        echo "El elemento ${buscar} está en la posición ${i}"
    fi
done

# Esto imprimirá "El elemento 4 está en la posición 3".
