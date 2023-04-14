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

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar directorio:|ls"

    "Verificar si un número es igual a 5:|read -r -p 'Escribir número: ' valor; if [[ \"$valor\" -eq 5 ]]; then echo 'El número es igual a 5'; else echo 'El número no es igual a 5'; fi"

    "Verificar si un número está en el rango [5, 10]:|read -r -p 'Escribir número: ' valor; verificar_rango \"\$valor\" 5 10"

    "Verificar si un número está en un rango dado:|read -r -p 'Escribir inicio del rango: ' inicio; read -r -p 'Escribir fin del rango: ' fin; for ((i = inicio; i <= fin; i++)); do verificar_rango \$i \$inicio \$fin; done"

    "Generar números aleatorios en el rango [0, 36], con una cantidad específica determinada por el usuario:|read -r -p 'Escribir cantidad de números aleatorios a generar: ' cantidad; generar_aleatorios \"\$cantidad\" 0 36"

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
