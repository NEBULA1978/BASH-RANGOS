#!/bin/bash

function generar_aleatorios {
    local cantidad=$1
    local fin=$2
    local frecuencias=()
    local pares=0
    local impares=0
    local ceros=0

    for ((i = 1; i <= cantidad; i++)); do
        num=$((RANDOM % (fin + 1)))
        frecuencias[$num]=$((${frecuencias[$num]} + 1))
        if [[ $num -eq 0 ]]; then
            ceros=$((ceros + 1))
        elif [[ $((num % 2)) -eq 0 ]]; then
            pares=$((pares + 1))
        else
            impares=$((impares + 1))
        fi
    done

    echo "Cantidad de veces que aparecen los números generados aleatoriamente:"
    for ((i = 0; i <= fin; i++)); do
        if [[ ${frecuencias[$i]} -gt 0 ]]; then
            echo "$i: ${frecuencias[$i]}"
        fi
    done
    echo "Cantidad de números pares: $pares"
    echo "Cantidad de números impares: $impares"
    echo "Cantidad de ceros: $ceros"
}

opciones=(
    "Generar números aleatorios en el rango [0, 36], con una cantidad específica determinada por el usuario:|read -r -p 'Escribir cantidad de números aleatorios a generar: ' cantidad; generar_aleatorios \"\$cantidad\" 36"
    "Salir:|exit 0"
)

while true; do
    clear
    echo "Ingrese el número de la opción deseada:"
    for i in "${!opciones[@]}"; do
        echo "$i. ${opciones[$i]%%|*}"
    done
    read -r opcion

    if [[ $opcion =~ ^[0-9]+$ ]] && [ "$opcion" -ge 0 ] && [ "$opcion" -lt ${#opciones[@]} ]; then
        clear
        comando="${opciones[$opcion]#*|}"
        eval "$comando"
        echo ""
        echo "Presione Enter para continuar..."
        read
    else
        echo "Opción inválida. Presione Enter para continuar..."
        read
    fi
done
