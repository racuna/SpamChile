#!/bin/bash

# Verificar si existe el archivo principal
if [ ! -f "ChileSpam.csv" ]; then
    echo "Error: No se encuentra ChileSpam.csv"
    exit 1
fi

echo "Procesando archivos CSV..."

# Crear un archivo temporal para almacenar números únicos
temp_file=$(mktemp)
temp_new=$(mktemp)

# Extraer todos los números de teléfono existentes (primera columna) de ChileSpam.csv
echo "Extrayendo números existentes de ChileSpam.csv..."
tail -n +2 ChileSpam.csv | cut -d',' -f1 | sort -u > "$temp_file"

# Procesar cada archivo CSV adicional (20*.csv)
for csv in 20*.csv; do
    # Saltar si el archivo no existe
    [ -f "$csv" ] || continue
    
    echo "Procesando $csv..."
    
    # Extraer números únicos del archivo actual y verificar si no existen en temp_file
    numbers_added=$(cut -d',' -f1 "$csv" | sort -u | comm -23 - "$temp_file" | wc -l)
    
    if [ $numbers_added -gt 0 ]; then
        # Filtrar las líneas que tienen números nuevos
        cut -d',' -f1 "$csv" | sort -u | comm -23 - "$temp_file" | while read -r number; do
            grep "^$number," "$csv"
        done >> "$temp_new"
        
        echo "Se encontraron $numbers_added números nuevos en $csv"
    else
        echo "No se encontraron números nuevos en $csv"
    fi
done

# Si hay nuevos registros, añadirlos a ChileSpam.csv
if [ -s "$temp_new" ]; then
    echo "Agregando nuevos registros a ChileSpam.csv..."
    cat "$temp_new" >> ChileSpam.csv
    echo "Proceso completado. Se actualizó ChileSpam.csv"
else
    echo "No se encontraron nuevos registros para agregar"
fi

# Limpiar archivos temporales
rm "$temp_file" "$temp_new"

echo "Proceso finalizado"