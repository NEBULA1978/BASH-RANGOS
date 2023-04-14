#!/bin/bash

# Ver todos los nombres por consola
echo "Buscando archivos de texto en el directorio home"
find ~ -type f -name "*.txt" -print | while read file; do
    echo "Archivo encontrado: $file"
done
