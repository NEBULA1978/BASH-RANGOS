#!/bin/bash

# Ver todos los nombres por consola
echo "Buscando archivos de texto en el directorio home"
find ~ -type f -name "*.txt" -print | while read file; do
    echo "Archivo encontrado: $file"
done

# This is a Bash script that searches for all text files in the home directory and displays their names on the console.

# The script uses the find command to search for files in the home directory (~). The find command is used with the following options:

#     -type f: specifies that only regular files should be returned, not directories or other types of files.
#     -name "*.txt": specifies that only files with names ending in ".txt" should be returned.
#     -print: specifies that the names of the files should be printed.

# The find command returns a list of file names that match the specified criteria, which are then read by the while loop line by line using the read command. The while loop prints the name of each file to the console using echo.

# The read command is a built-in Bash command that reads a line of input from the standard input and assigns its words to variables. In this script, the read command is used to read the file names returned by the find command.

# The script doesn't have any parameters or arguments, so it will always search for text files in the home directory. If you want to search for files in a different directory, you can change the ~ in the find command to the path of the directory you want to search.
# Ramonet Pascualet
# en castellano

# Este es un script de Bash que busca todos los archivos de texto en el directorio home y muestra sus nombres en la consola.

# El script utiliza el comando find para buscar archivos en el directorio home (~). El comando find se utiliza con las siguientes opciones:

#     -type f: especifica que solo se devolverán archivos regulares, no directorios ni otros tipos de archivos.
#     -name "*.txt": especifica que solo se devolverán archivos con nombres que terminen en ".txt".
#     -print: especifica que se imprimirán los nombres de los archivos.

# El comando find devuelve una lista de nombres de archivo que coinciden con los criterios especificados, que luego son leídos por el bucle while línea por línea utilizando el comando read. El bucle while muestra el nombre de cada archivo en la consola utilizando echo.

# El comando read es un comando integrado de Bash que lee una línea de entrada desde la entrada estándar y asigna sus palabras a variables. En este script, el comando read se utiliza para leer los nombres de archivo devueltos por el comando find.

# El script no tiene parámetros ni argumentos, por lo que siempre buscará archivos de texto en el directorio home. Si desea buscar archivos en un directorio diferente, puede cambiar el ~ en el comando find por la ruta del directorio que desea buscar.