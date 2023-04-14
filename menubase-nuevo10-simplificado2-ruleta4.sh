#!/bin/bash

function generar_numero_aleatorio {
    local inicio=$1
    local fin=$2
    echo $((RANDOM % (fin - inicio + 1) + inicio))
}

function jugar_apuestas {
    saldo=1000
    apuesta_inicial=1
    declare -A conteo_numeros
    conteo_par=0
    conteo_impar=0
    conteo_cero=0

    echo "Elije una opción:"
    echo "1. Par"
    echo "2. Impar"
    echo "3. Cero"
    read -r opcion

    echo "¿Cuántas veces quieres jugar?"
    read -r num_veces

    for ((i = 1; i <= num_veces; i++)); do
        if [ $saldo -le 0 ]; then
            break
        fi

        clear
        echo "Saldo actual: $saldo"
        apuesta=$apuesta_inicial
        echo "Cantidad apostada: $apuesta"
        echo "Jugando la opción $opcion"

        resultado=$(generar_numero_aleatorio 0 36)
        echo "Resultado: $resultado"

        ((conteo_numeros[$resultado]++))

        if [ $((resultado % 2)) -eq 0 ]; then
            ((conteo_par++))
        else
            ((conteo_impar++))
        fi

        if [ "$resultado" -eq 0 ]; then
            ((conteo_cero++))
        fi

        if [ "$opcion" -eq 1 ] && [ $((resultado % 2)) -eq 0 ] || [ "$opcion" -eq 2 ] && [ $((resultado % 2)) -eq 1 ] || [ "$opcion" -eq 3 ] && [ "$resultado" -eq 0 ]; then
            saldo=$((saldo + apuesta))
            echo "¡Ganaste! Tu saldo actual es: $saldo"
        else
            saldo=$((saldo - apuesta))
            apuesta_inicial=$((apuesta_inicial * 2))
            echo "Perdiste. Tu saldo actual es: $saldo"
        fi
    done

    echo "Estadísticas de resultados:"
    echo "Pares: $conteo_par"
    echo "Impares: $conteo_impar"
    echo "Ceros: $conteo_cero"
    echo "Conteo de números:"
    for num in "${!conteo_numeros[@]}"; do
        echo "$num: ${conteo_numeros[$num]}"
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
    for ((i = 1; i <= ${#opciones[@]}; i++)); do
        echo "$i. ${opciones[$i - 1]%%|*}" # Imprimimos el índice de la opción y su nombre (sin el comando correspondiente).
    done

    read -r opcion
    # Validamos que la opción ingresada sea un número válido dentro del rango de opciones.
    if [[ $opcion =~ ^[0-9]+$ ]] && [ "$opcion" -ge 1 ] && [ "$opcion" -le ${#opciones[@]} ]; then

        clear
        comando="${opciones[$opcion - 1]#*|}" # Obtenemos el comando correspondiente a la opción seleccionada.
        eval "$comando"                   # Ejecutamos el comando.
        echo ""
        echo "Presione Enter para continuar..."
        read
    else
        echo "Opción inválida. Presione Enter para continuar..."
        read
    fi
done

# Este es un script de Bash que simula un juego de apuestas en la ruleta. El usuario puede elegir entre apostar por números pares, impares o el número cero. Cada vez que se juega, se genera un número aleatorio entre 0 y 36, y se comprueba si el usuario ganó o perdió la apuesta. El saldo inicial es de 1000, y el usuario puede jugar tantas veces como desee, o hasta que se quede sin dinero.

# Además de las estadísticas de resultados (cantidad de números pares, impares, ceros y conteo de cada número jugado), el script también incluye un menú de opciones que permite al usuario elegir entre jugar nuevamente o salir del juego. El menú se imprime en pantalla y se valida que la opción seleccionada sea un número válido dentro del rango de opciones.