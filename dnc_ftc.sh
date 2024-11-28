#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 <año>"
    exit 1
fi

year=$1
temp_dir=$(mktemp -d)
output_file="${year}.csv"

echo "Iniciando proceso para el año $year"
echo "Directorio temporal: $temp_dir"
echo "Archivo de salida: $output_file"

# Crear archivo vacío de salida
> "$output_file"

for month in {01..12}; do
    echo -e "\nProcesando mes $month..."
    
    for day in {01..31}; do
        url="https://www.ftc.gov/sites/default/files/DNC_Complaint_Numbers_${year}-${month}-${day}.csv"
        temp_file="${temp_dir}/${year}-${month}-${day}.csv"
        
        echo -n "Descargando $year-$month-$day... "
        
        # Intentar descargar el archivo
        if curl -s -f -o "$temp_file" "$url"; then
            nums=$(awk -F',' 'NR>1 && $1 ~ /^56/ {print $1","$7}' "$temp_file" | wc -l)
            echo "OK - Encontrados $nums números chilenos"
            
            # Procesar archivo si existe y extraer números chilenos
            awk -F',' 'NR>1 && $1 ~ /^56/ {print $1","$7}' "$temp_file" >> "$output_file"
        else
            echo "Error - Archivo no encontrado"
        fi
    done
done

total=$(wc -l < "$output_file")
echo -e "\nProceso completado"
echo "Total de números chilenos encontrados: $total"
echo "Limpiando archivos temporales..."

# Limpiar archivos temporales
rm -rf "$temp_dir"

echo "¡Proceso finalizado!"