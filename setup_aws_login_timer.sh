#!/bin/bash

# Variables
SERVICE_NAME="aws-login"
SERVICE_PATH="/etc/systemd/system/${SERVICE_NAME}.service"
TIMER_PATH="/etc/systemd/system/${SERVICE_NAME}.timer"
SCRIPT_PATH="/usr/local/bin/aws_login.sh"
LOG_PATH="/var/log/aws_login.log"

# Crear el script de AWS Login si no existe
if [ ! -f "$SCRIPT_PATH" ]; then
    echo "Creando el script $SCRIPT_PATH..."
    cat <<EOF > "$SCRIPT_PATH"
#!/bin/bash
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

export AWS_ACCESS_KEY_ID="*************"
export AWS_SECRET_ACCESS_KEY="****************"
export AWS_DEFAULT_REGION="us-east-1"
export AWS_ACCOUNT_ID="*****************"

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin *************.dkr.ecr.us-east-1.amazonaws.com
EOF
    chmod +x "$SCRIPT_PATH"
    echo "✅ Script de AWS creado y marcado como ejecutable."
else
    echo "⚠️ El script $SCRIPT_PATH ya existe. Omitiendo creación."
fi

# Crear el servicio systemd
echo "Creando el servicio systemd en $SERVICE_PATH..."
cat <<EOF | sudo tee "$SERVICE_PATH" > /dev/null
[Unit]
Description=AWS ECR Login Script
After=network.target

[Service]
Type=oneshot
ExecStart=$SCRIPT_PATH
StandardOutput=append:$LOG_PATH
StandardError=append:$LOG_PATH
EOF
echo "✅ Servicio creado."

# Crear el timer systemd
echo "Creando el timer systemd en $TIMER_PATH..."
cat <<EOF | sudo tee "$TIMER_PATH" > /dev/null
[Unit]
Description=Ejecuta AWS ECR Login cada 11 horas

[Timer]
OnUnitActiveSec=11h
Persistent=true

[Install]
WantedBy=timers.target
EOF
echo "✅ Timer creado."

# Recargar systemd y habilitar el timer
echo "Recargando systemd..."
sudo systemctl daemon-reload

echo "Habilitando y arrancando el timer..."
sudo systemctl enable "${SERVICE_NAME}.timer"
sudo systemctl start "${SERVICE_NAME}.timer"

# Mostrar estado del timer
echo "⏳ Estado del timer:"
systemctl list-timers --all | grep "$SERVICE_NAME"

echo "✅ Configuración completada. El script AWS Login se ejecutará cada 11 horas."
