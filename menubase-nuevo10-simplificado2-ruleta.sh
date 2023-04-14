#!/bin/bash

function generar_aleatorio {
    local fin=$1
    echo $((RANDOM % (fin + 1)))
}

function apostar {
    local opcion=$1
    local cantidad_apostada=$2
    local dinero_total=$3
    local resultado=$4

    case $opcion in
        "par") [[ $((resultado % 2)) -eq 0 ]] ;;
        "impar") [[ $((resultado % 2)) -ne 0 ]] ;;
        "cero") [[ $resultado -eq 0 ]] ;;
        *) return 1 ;;
    esac

    if [[ $? -eq 0 ]]; then
        dinero_total=$((dinero_total + cantidad_apostada))
        echo "¡Ganaste! Tu saldo actual es: $dinero_total"
    else
        dinero_total=$((dinero_total - cantidad_apostada))
        echo "Perdiste. Tu saldo actual es: $dinero_total"
    fi

    echo $dinero_total
}

while true; do
    read -r -p '¿Cuánto dinero deseas jugar? ' dinero
    if [[ $dinero =~ ^[0-9]+$ ]]; then
        break
    else
        echo "Por favor, introduce una cantidad válida."
    fi
done

cantidad_apostada=1
while [[ $dinero -gt 0 ]]; do
    while true; do
        echo "Saldo actual: $dinero"
        echo "Cantidad apostada: $cantidad_apostada"
        echo "Elije una opción:"
        echo "1. Par"
        echo "2. Impar"
        echo "3. Cero"
        echo "4. Salir"
        read -r opcion

        case $opcion in
            1) opcion="par" ;;
            2) opcion="impar" ;;
            3) opcion="cero" ;;
            4) exit 0 ;;
            *) echo "Opción inválida. Por favor, elija una opción válida."; continue ;;
        esac

        if [[ $cantidad_apostada -gt $dinero ]]; then
            echo "No tienes suficiente dinero para cubrir la apuesta. Por favor, elige otra opción."
            continue
        fi

        break
    done

    resultado=$(generar_aleatorio 36)
    echo "Resultado: $resultado"
    dinero=$(apostar "$opcion" $cantidad_apostada $dinero $resultado)

    if [[ $dinero -gt 0 ]]; then
        cantidad_apostada=$((cantidad_apostada * 2))
    else
        echo "Te has quedado sin dinero."
    fi

    echo "Presione Enter para continuar..."
    read
done
