#!/bin/bash

# Definir función para verificar si un número está en el rango [5, 10]
function verificar_rango {
    if (($1 >= 5 && $1 <= 10)); then
        echo "El número $1 está en el rango [5, 10]"
    else
        echo "El número $1 no está en el rango [5, 10]"
    fi
}

# Mostrar menú
while true; do
    echo ""
    echo "1. Verificar si un número es igual a 5"
    echo "2. Verificar si un número está en el rango [5, 10]"
    echo "3. Verificar si un número está en el rango [5, 10] for"
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
        verificar_rango $valor
        ;;
    3)
        for ((i = 5; i <= 10; i++)); do
            verificar_rango $i
        done
        ;;
    4) exit ;;
    *) echo "Opción inválida. Por favor, elegir una opción válida." ;;
    esac
done
