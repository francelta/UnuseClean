#!/bin/bash

# Define la ruta de búsqueda
search_path="/"

# Define la extensión de los archivos a buscar
file_extension=".dmg .pkg .app"

# Define el tiempo mínimo (en días) para considerar un archivo como residuo
read -p "Ingrese la edad mínima de los archivos a eliminar (en días): " min_age


# Busca los archivos en la ruta especificada y los filtra por extensión y tiempo
find "$search_path" -type f -name "*$file_extension" -mtime "+$min_age" -print0 |

# Borra los archivos encontrados y pregunta antes de borrar cada archivo
while read -d $'\0' file; do
    echo "¿Quieres borrar este archivo? $file"
    read -p "[s/n]: " response
    if [[ "$response" =~ ^[sS]$ ]]; then
        rm "$file"
        echo "Archivo borrado: $file"
    fi
done
