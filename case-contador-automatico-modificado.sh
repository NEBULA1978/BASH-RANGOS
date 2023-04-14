#!/bin/bash


# Función que utiliza el switch case para ejecutar código dependiendo de la opción ingresada
switch_case() {
	local opcion
	opcion=$(echo "$1" | tr '[:upper:]' '[:lower:]')

	if [ "$opcion" = "a" ]; then
		((contador_a++))
	elif [ "$opcion" = "b" ]; then
		((contador_b++))
	else
		echo "Opcion invalida"
	fi
}

# Contadores para las opciones a y b
contador_a=0
contador_b=0

# Pedir al usuario la cantidad de combinaciones aleatorias a ejecutar o ingresarlas manualmente
read -p "Ingrese la cantidad de combinaciones aleatorias a ejecutar o escriba las combinaciones separadas por comas: " input

# Verificar si el usuario ingresó una cantidad de combinaciones aleatorias
if [[ "$input" =~ ^[0-9]+$ ]]; then
	cantidad_combinaciones=$input

	# Ejecutar las combinaciones aleatorias
	echo "Ejecutando $cantidad_combinaciones combinaciones aleatorias..."
	for (( i=1; i<=cantidad_combinaciones; i++ )); do
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
	done
else
	# El usuario ingresó las combinaciones aleatorias manualmente
	combinaciones=($(echo "$input" | tr ',' ' '))

	# Ejecutar las combinaciones aleatorias
	echo "Ejecutando ${#combinaciones[@]} combinaciones aleatorias..."
	for combinacion in "${combinaciones[@]}"; do
		# Asignar la opción "a" o "b" en consecuencia
		if [ "$combinacion" = "a" ]; then
			opcion="a"
		elif [ "$combinacion" = "b" ]; then
			opcion="b"
		else
			echo "Combinación inválida: $combinacion"
			continue
		fi

		# Procesar la opción
		switch_case "$opcion"
	done
fi

# Mostrar resultados
echo "Opciones ingresadas: "
echo "A=$contador_a, B=$contador_b"

    # Se usó el operador de comparación = en lugar de ==, ya que la herramienta ShellCheck sugiere que = es más portable.
    # Se eliminó el $ antes de la variable cantidad_combinaciones en la línea del bucle for, ya que es redundante.
    # Se eliminó el ${} antes de las variables contador_a y contador_b en la línea de salida final, ya que es redundante.
# ///////////////////////////////////
# ///////////////////////////////////

# Función que utiliza el switch case para ejecutar código dependiendo de la opción ingresada
# switch_case() {
# 	local opcion
# 	opcion=$(echo "$1" | tr '[:upper:]' '[:lower:]')

# 	if [ "$opcion" == "a" ]; then
# 		((contador_a++))
# 	elif [ "$opcion" == "b" ]; then
# 		((contador_b++))
# 	else
# 		echo "Opcion invalida"
# 	fi
# }

# # Contadores para las opciones a y b
# contador_a=0
# contador_b=0

# # Pedir al usuario la cantidad de combinaciones aleatorias a ejecutar
# read -p "Ingrese la cantidad de combinaciones aleatorias a ejecutar: " cantidad_combinaciones

# # Ejecutar las combinaciones aleatorias
# echo "Ejecutando $cantidad_combinaciones combinaciones aleatorias..."
# for (( i=1; i<=$cantidad_combinaciones; i++ )); do
# 	# Generar un número aleatorio entre 0 y 1
# 	random=$(shuf -i 0-1 -n 1)

# 	# Asignar la opción "a" o "b" en consecuencia
# 	if [ "$random" -eq 0 ]; then
# 		opcion="a"
# 	else
# 		opcion="b"
# 	fi

# 	# Procesar la opción
# 	switch_case "$opcion"
# done

# # Mostrar resultados
# echo "Opciones ingresadas: "
# echo "A=$contador_a, B=$contador_b"
