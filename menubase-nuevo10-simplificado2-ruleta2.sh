#!/bin/bash

function generar_numero_aleatorio {
    local inicio=$1
    local fin=$2
    echo $((RANDOM % (fin - inicio + 1) + inicio))
}

function jugar_apuestas {
    saldo=1000
    apuesta_inicial=1

    while [ $saldo -gt 0 ]; do
        clear
        echo "Saldo actual: $saldo"
        apuesta=$apuesta_inicial
        echo "Cantidad apostada: $apuesta"
        echo "Elije una opción:"
        echo "1. Par"
        echo "2. Impar"
        echo "3. Cero"
        echo "4. Salir"
        read -r opcion

        if [ "$opcion" -eq 4 ]; then
            break
        fi

        resultado=$(generar_numero_aleatorio 0 36)
        echo "Resultado: $resultado"

        if [ "$opcion" -eq 1 ] && [ $((resultado % 2)) -eq 0 ] || [ "$opcion" -eq 2 ] && [ $((resultado % 2)) -eq 1 ] || [ "$opcion" -eq 3 ] && [ "$resultado" -eq 0 ]; then
            saldo=$((saldo + apuesta))
            echo "¡Ganaste! Tu saldo actual es: $saldo"
        else
            saldo=$((saldo - apuesta))
            apuesta_inicial=$((apuesta_inicial * 2))
            echo "Perdiste. Tu saldo actual es: $saldo"
        fi
        echo "Presione Enter para continuar..."
        read
    done

    echo "Te has quedado sin dinero."
    echo "Presione Enter para continuar..."
    read
}

# Aquí está el menú de opciones
opciones=(
    "Jugar apuestas en números aleatorios en el rango [0, 36]:|jugar_apuestas"
    "Salir:|exit 0"
)

while true; do
    clear
    echo "Ingrese el número de la opción deseada:"
    for i in "${!opciones[@]}"; do
        echo "$i. ${opciones[$i]%%|*}" # Imprimimos el índice de la opción y su nombre (sin el comando correspondiente).
    done
    read -r opcion

    # Validamos que la opción ingresada sea un número válido dentro del rango de opciones.
    if [[ $opcion =~ ^[0-9]+$ ]] && [ "$opcion" -ge 0 ] && [ "$opcion" -lt ${#opciones[@]} ]; then
        clear
        comando="${opciones[$opcion]#*|}" # Obtenemos el comando correspondiente a la opción seleccionada.
        eval "$comando"                   # Ejecutamos el comando.
        echo ""
        echo "Presione Enter para continuar..."
        read
    else
        echo "Opción inválida. Presione Enter para continuar..."
        read
    fi
done
