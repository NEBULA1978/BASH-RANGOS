#!/bin/bash

# #!/bin/bash

# Por supuesto, aquí te presento algunos ejemplos de programación estructurada:

#     Un programa que impriime los números del 1 al 10 en orden ascendente:

for i in {1..10}; do
    echo "$i"
    sum=$((sum + i))
done

echo "La suma de los números del 1 al 10 es: \$sum"

# Un programa que calcula el promedio de 3 números ingresados por el usuario:

echo "Ingrese el primer número:"
read -r num1
echo "Ingrese el segundo número:"
read -r num2
echo "Ingrese el tercer número:"
read -r num3

promedio=$(echo "scale=2; ($num1 + $num2 + $num3) / 3" | bc)
echo "El promedio es: $promedio"

# Un programa que verifica si un número ingresado por el usuario es par o impar:

echo "Ingrese un número:"
read num

if ((num % 2 == 0)); then
    echo "$num es par"
else
    echo "$num es impar"
fi

# Un programa que suma los elementos de un arreglo:

numeros=(1 2 3 4 5)
suma=0

for i in "${numeros[@]}"; do
    suma=$((suma + i))
done

echo "La suma es: $suma"

# Un programa que calcula el factorial de un número ingresado por el usuario:

echo "Ingrese un número:"
read num

factorial=1
for ((i = 2; i <= num; i++)); do
    factorial=$((factorial * i))
done

echo "$num! = $factorial"
