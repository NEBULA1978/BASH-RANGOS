#!/bin/bash


# Función que utiliza el switch case para ejecutar código dependiendo de la opción ingresada
switch_case() {
	local opcion
	opcion=$(echo "$1" | tr '[:upper:]' '[:lower:]')

	if [ "$opcion" == "a" ]; then
		echo "Ha ingresado la opcion A"
		((contador_a++))
	elif [ "$opcion" == "b" ]; then
		echo "Ha ingresado la opcion B"
		((contador_b++))
	else
		echo "Opcion invalida"
	fi
}

# Contadores para las opciones a y b
contador_a=0
contador_b=0

# Ejecutar durante un minuto
echo "Ejecutando durante un minuto..."
tiempo_inicio=$(date +%s)
while (($(date +%s) < tiempo_inicio + 60)); do
	# Generar un número aleatorio entre 0 y 1
	random=$(shuf -i 0-1 -n 1)

	# Asignar la opción "a" o "b" en consecuencia
	if [ "$random" -eq 0 ]; then
		opcion="a"
	else
		opcion="b"
	fi

	# Procesar la opción
	switch_case "$opcion"

	# Esperar 1 segundo antes de la siguiente iteración
	sleep 1
done

# Mostrar resultados
echo "Opciones ingresadas: "
echo "A=$contador_a, B=$contador_b"

# ///////////////////////////////////
# ///////////////////////////////////

# Función que utiliza el switch case para ejecutar código dependiendo de la opción ingresada
# switch_case() {
# 	local opcion=$(echo $1 | tr '[:upper:]' '[:lower:]')

# 	if [ "$opcion" == "a" ]; then
# 		echo "Ha ingresado la opcion A"
# 		((contador_a++))
# 	elif [ "$opcion" == "b" ]; then
# 		echo "Ha ingresado la opcion B"
# 		((contador_b++))
# 	else
# 		echo "Opcion invalida"
# 	fi
# }

# # Contadores para las opciones a y b
# contador_a=0
# contador_b=0

# # Ejecutar durante un minuto
# echo "Ejecutando durante un minuto..."
# tiempo_inicio=$(date +%s)
# while (($(date +%s) < tiempo_inicio + 60)); do
# 	# Generar un número aleatorio entre 0 y 1
# 	random=$(shuf -i 0-1 -n 1)

# 	# Asignar la opción "a" o "b" en consecuencia
# 	if [ "$random" -eq 0 ]; then
# 		opcion="a"
# 	else
# 		opcion="b"
# 	fi

# 	# Procesar la opción
# 	switch_case $opcion

# 	# Esperar 1 segundo antes de la siguiente iteración
# 	sleep 1
# done

# # Mostrar resultados
# echo "Opciones ingresadas: "
# echo "A=$contador_a, B=$contador_b"
