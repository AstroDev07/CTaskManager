#!/bin/sh

cd .. || exit
cd .tasks || exit

# Definir códigos de escape para colores de texto
ROJO="\033[31m"
VERDE="\033[32m"
AMARILLO="\033[33m"
RESETEAR="\033[0m"

echo "${AMARILLO}Diga el título de la tarea: ${RESETEAR}"
read title  # Agregamos -r para evitar problemas con las barras invertidas

# Validación de entrada
if [ -z "$title" ] || [ -z "${title##* }" ]; then
    echo "${ROJO}El título no puede estar vacío.${RESETEAR}"
    exit 1
fi

# Generar un nombre más amigable para el archivo (en minúsculas y con guiones bajos en lugar de espacios)
file_name="$(echo "$title" | tr ' ' '_' | tr '[:upper:]' '[:lower:]').txt"

# Comprobar si la tarea ya existe
if [ -f "$file_name" ]; then
    echo "${ROJO}La tarea ya existe.${RESETEAR}"
    exit 1
else
    echo "${AMARILLO}Diga la descripción de la tarea: ${RESETEAR}"
    read description  # Agregamos -r para evitar problemas con las barras invertidas

    # Validación de entrada
    if [ -z "$description" ] || [ -z "${description##* }" ]; then
        echo "${ROJO}La descripción no puede estar vacía.${RESETEAR}"
        exit 1
    fi

    # Crear el archivo de la tarea
    echo "$description" > "$file_name"  # Agregamos comillas para manejar espacios en la descripción
    echo "${VERDE}Se creó la tarea.${RESETEAR}"

    # Registrar la acción
    echo "Nueva tarea creada: $title" >> ~/.tasks.log
fi

exit 0
