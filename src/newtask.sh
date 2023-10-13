cd ..
cd .tasks

# Definir códigos de escape para colores de texto
ROJO="\e[31m"
VERDE="\e[32m"
AMARILLO="\e[33m"
RESETEAR="\e[0m"

echo -e "${AMARILLO}Diga el título de la tarea: ${RESETEAR}"
read title

# Validación de entrada
if [ -z "$title" ] || [ -z "${title// }" ]; then
    echo -e "${ROJO}El título no puede estar vacío.${RESETEAR}"
    exit 1
fi

# Generar un nombre más amigable para el archivo (en minúsculas y con guiones bajos en lugar de espacios)
file_name="$(echo $title | tr ' ' '_' | tr '[:upper:]' '[:lower:]').txt"

# Comprobar si la tarea ya existe
if [ -f "$file_name" ]; then
    echo -e "${ROJO}La tarea ya existe.${RESETEAR}"
    exit 1
else
    echo -e "${AMARILLO}Diga la descripción de la tarea: ${RESETEAR}"
    read description

    # Validación de entrada
    if [ -z "$description" ] || [ -z "${description// }" ]; then
        echo -e "${ROJO}La descripción no puede estar vacía.${RESETEAR}"
        exit 1
    fi

    # Crear el archivo de la tarea
    echo $description > "$file_name"
    echo -e "${VERDE}Se creó la tarea.${RESETEAR}"

    # Registrar la acción
    echo "Nueva tarea creada: $title" >> ~/.tasks.log
fi

exit 0
