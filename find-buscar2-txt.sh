#!/bin/bash

if [ -z "$1" ]; then
  echo "Debe proporcionar el nombre del archivo que desea buscar."
  exit 1
fi

echo "Buscando archivo $1 en el directorio home"
find ~ -type f -name "$1" -print | while read file; do
  echo "Archivo encontrado: $file"
done

# En este ejemplo, se ha agregado un if statement para verificar si se ha proporcionado un argumento en la línea de comandos. Si no se proporciona un argumento, se muestra un mensaje de error y se sale del script con un código de salida de 1.

# Si se proporciona un argumento, el script utiliza el argumento en lugar de "*.txt" en el comando find para buscar solo los archivos con el nombre especificado. El nombre del archivo se utiliza en el mensaje que se muestra en la consola cuando se encuentra un archivo que coincide.

# Para ejecutar el script y buscar un archivo .txt específico, debes proporcionar el nombre del archivo en la línea de comandos después de llamar el script, de la siguiente manera:

# ./buscar_txt.sh archivo_buscar.txt

# En este ejemplo, se asume que el nombre del archivo es archivo_buscar.txt. Si el archivo no se encuentra, no se mostrará ningún mensaje.