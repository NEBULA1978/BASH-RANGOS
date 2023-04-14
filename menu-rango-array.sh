#!/bin/bash

while true; do
    echo "2. Escribe un número para ver si es igual a 5"
    echo "3. Escribe un número para ver el rango entre 5 y 10 "
    echo "4. Salir"
    echo ""
    #Escoger menu
    echo -n "Escoger opcion: "
    read -r opcion
    #Seleccion de menu
    case $opcion in
    2)
        echo "Escribe un número"
        echo -n "Escribe un número: "
        read -r valor

        if [[ $valor -ne 5 ]]; then
            echo "Tu numero no es igual a 5"
        else
            echo "Tu numero es igual a 5"
        fi

    # -gt: mayor que (greater than)
    # -ge: mayor o igual que (greater or equal)
    # -lt: menor que (lower than)
    # -le: menor o igual que (lower or equal)
    # -eq: igual que (equal)
    # -ne: no igual que (not equal)

# Estos operadores son útiles para comparar números enteros en Bash. También hay operadores de comparación de cadenas (=, !=, <, >),
        ;;
    3)
        echo "Escribe un número para ver el rango entre 5 y 10 "

        echo -n "Escribe un número: "
        read -r valor

        if [ "$valor" -lt 5 ] || [ "$valor" -gt 10 ]; then
            echo "Tu numero está fuera del rango [5, 10]"
        else
            echo "Tu numero está en el rango [5, 10]"
        fi

        # -a and
        # -o or
        ;;
    4)
        exit 0
        ;;
    #Alerta
    *)
        echo "Opcion invalida..."
        sleep 1
        ;;
    esac
done
