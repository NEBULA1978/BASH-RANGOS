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
	elif [ "$opcion" == "s" ]; then
		echo "Ha ingresado la opcion salir"
		echo "Opciones ingresadas: "
		echo "A=$contador_a, B=$contador_b"
		exit 0
	else
		echo "Opcion invalida"
	fi
}

# Contadores para las opciones a y b
contador_a=0
contador_b=0

# Solicitar opciones al usuario
while true; do
	read -r -p "Ingrese una opcion [a, b, s]: " opcion
	switch_case "$opcion"
done

# //////////////////////////////
# //////////////////////////////

# # Función que utiliza el switch case para ejecutar código dependiendo de la opción ingresada
# switch_case() {
# 	local opcion=$(echo $1 | tr '[:upper:]' '[:lower:]')

# 	if [ "$opcion" == "a" ]; then
# 		echo "Ha ingresado la opcion A"
# 		((contador_a++))
# 	elif [ "$opcion" == "b" ]; then
# 		echo "Ha ingresado la opcion B"
# 		((contador_b++))
# 	elif [ "$opcion" == "s" ]; then
# 		echo "Ha ingresado la opcion salir"
# 		echo "Opciones ingresadas: "
# 		echo "A=$contador_a, B=$contador_b"
# 		exit 0
# 	else
# 		echo "Opcion invalida"
# 	fi
# }

# # Contadores para las opciones a y b
# contador_a=0
# contador_b=0

# # Solicitar opciones al usuario
# while true; do
# 	read -r "Ingrese una opcion [a, b, s]: " opcion
# 	switch_case "$opcion"
# done

# Este código utiliza la función switch_case para procesar las opciones ingresadas por el usuario. La función convierte la opción ingresada a minúsculas antes de compararla con las opciones válidas.

# # El programa utiliza un bucle while para solicitar continuamente opciones al usuario. Los contadores para las opciones "a" y "b" se incrementan según corresponda, y cuando el usuario ingresa la opción "salir", se muestra el número de opciones ingresadas para las opciones "a" y "b" y el programa termina.
