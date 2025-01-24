#!/bin/bash

# Directorio donde se encuentran los archivos
directory="jenkins_home/bk_jenkins/FULL---"

# Cambiar al directorio especificado
cd "$directory" || { echo "Error: No se pudo acceder al directorio $directory"; exit 1; }

# Archivos a preservar
preserve_file="jenkins.plugins.nodejs.tools.NodeJSInstallation.xml"

# Eliminar archivos que cumplen las condiciones
for file in hudson.* org.* com.* jenkins.*; do
  # Verificar si el archivo existe
  if [[ -f "$file" ]]; then
    # Verificar si es el archivo a preservar
    if [[ "$file" == "$preserve_file" ]]; then
      echo "Preservando: $file"
    else
      echo "Eliminando: $file"
      rm "$file"
    fi
  fi

done

# Confirmación final
echo "Proceso completado. Archivos eliminados según las condiciones."