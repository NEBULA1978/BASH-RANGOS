#!/bin/bash

# Definir función para verificar si un número está en el rango [inicio, fin]
function verificar_rango {
    inicio=$2
    fin=$3
    if (($1 >= inicio && $1 <= fin)); then
        echo "El número $1 está en el rango [$inicio, $fin]"
    else
        echo "El número $1 no está en el rango [$inicio, $fin]"
    fi
}

# Definir función para generar números aleatorios y contar su frecuencia
function generar_aleatorios {
    local cantidad=$1
    local inicio=$2
    local fin=$3
    local frecuencias=()

    for ((i = 1; i <= cantidad; i++)); do
        num=$((RANDOM % (fin + 1)))
        echo "Número aleatorio $i: $num"
        verificar_rango $num $inicio $fin
        frecuencias[$num]=$((${frecuencias[$num]} + 1))
    done

    echo "Cantidad de veces que aparecen los números generados aleatoriamente:"
    for ((i = 0; i <= fin; i++)); do
        if [[ ${frecuencias[$i]} -gt 0 ]]; then
            echo "$i: ${frecuencias[$i]}"
        fi
    done
}

# Mostrar menú
while true; do
    echo ""
    echo "1. Verificar si un número es igual a 5"
    echo "2. Verificar si un número está en el rango [5, 10]"
    echo "3. Verificar si un número está en un rango dado"
    echo "5. Generar números aleatorios en el rango [0, 36], con una cantidad específica determinada por el usuario"
    echo "4. Salir"
    read -r -p "Elegir opción: " opcion

    case $opcion in
    1)
        read -r -p "Escribir número: " valor
        if [[ "$valor" -eq 5 ]]; then
            echo "El número es igual a 5"
        else
            echo "El número no es igual a 5"
        fi
        ;;
    2)
        read -r -p "Escribir número: " valor
        verificar_rango "$valor" 5 10
        ;;
    3)
        read -r -p "Escribir inicio del rango: " inicio
        read -r -p "Escribir fin del rango: " fin
        for ((i = "$inicio"; i <= "$fin"; i++)); do
            verificar_rango $i "$inicio" "$fin"
        done
        ;;
    5)
        read -r -p "Escribir cantidad de números aleatorios a generar: " cantidad
        generar_aleatorios "$cantidad" 0 36
        ;;

    4) exit ;;
    *) echo "Opción inválida. Por favor, elegir una opción válida." ;;
    esac
done

# El siguiente script en bash presenta un menú que permite al usuario elegir entre diferentes opciones:

#     Verificar si un número es igual a 5.
#     Verificar si un número está en el rango [5, 10].
#     Verificar si un número está en un rango dado.
#     Salir.
#     Generar números aleatorios en el rango [0, 36], con una cantidad específica determinada por el usuario.

# La opción 1 simplemente pide al usuario que escriba un número y verifica si es igual a 5.

# La opción 2 también pide al usuario que escriba un número y verifica si está en el rango [5, 10] utilizando la función "verificar_rango".

# La opción 3 pide al usuario que escriba el inicio y el fin de un rango y utiliza un ciclo para llamar a la función "verificar_rango" para cada número en ese rango.

# La opción 5 pide al usuario que escriba una cantidad de números aleatorios a generar y luego genera esa cantidad de números aleatorios en el rango [0, 36] utilizando la función "generar_aleatorios". Esta función genera cada número aleatorio, llama a "verificar_rango" para ese número y también cuenta la frecuencia de cada número generado.

# El script utiliza dos funciones definidas en él, "verificar_rango" y "generar_aleatorios". La primera función toma tres argumentos: un número a verificar y los límites del rango en el que se debe verificar si el número está. La función simplemente compara el número con los límites del rango y muestra un mensaje apropiado.

# La segunda función toma tres argumentos: la cantidad de números aleatorios que se deben generar y los límites del rango en el que deben generarse. La función genera la cantidad de números aleatorios especificados y llama a "verificar_rango" para cada número generado. También cuenta la frecuencia de cada número generado y muestra la frecuencia de cada número después de generar todos los números aleatorios.

# El script utiliza un ciclo while que se ejecuta indefinidamente hasta que el usuario elija la opción "Salir" (opción 4). Dentro de este ciclo, el script muestra el menú, pide al usuario que elija una opción y ejecuta el código correspondiente a esa opción utilizando un case. Si el usuario elige una opción inválida, se muestra un mensaje de error y se le solicita que elija una opción válida.