#!/bin/bash

# Configuración del script
set -e

# Verificar si se está ejecutando como root
if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ejecutarse como root o con sudo."
   exit 1
fi

# Actualizar los paquetes del sistema
echo "Actualizando los paquetes del sistema..."
apt update && apt upgrade -y

# Instalar dependencias necesarias
echo "Instalando dependencias necesarias..."
apt install -y curl unzip

# Descargar el instalador de AWS CLI
echo "Descargando AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Extraer el instalador
echo "Extrayendo AWS CLI..."
unzip awscliv2.zip

# Instalar AWS CLI
echo "Instalando AWS CLI..."
./aws/install

# Verificar la instalación
echo "Verificando la instalación de AWS CLI..."
if command -v aws &> /dev/null; then
    echo "AWS CLI se ha instalado correctamente."
    aws --version
else
    echo "Hubo un problema al instalar AWS CLI."
    exit 1
fi

# Configurar AWS CLI
echo "Configurando AWS CLI..."
echo "Por favor, introduce los valores solicitados para configurar AWS CLI:"
aws configure

# Limpiar archivos temporales
echo "Limpiando archivos temporales..."
rm -rf awscliv2.zip aws

echo "Instalación y configuración de AWS CLI completada."
