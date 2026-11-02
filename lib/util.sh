#!/bin/bash
# lib/utils.sh - Funciones y variables compartidas por todos los módulos.
# Requiere que la variable DIR (carpeta del proyecto) esté definida antes.

# --- Colores (secuencias de escape ANSI) ---
VERDE='\033[0;32m'
ROJO='\033[0;31m'
AMARILLO='\033[1;33m'
AZUL='\033[0;34m'
NC='\033[0m'            # "No Color": vuelve al color normal

LOG_FILE="$DIR/logs/mantenimiento.log"
mkdir -p "$DIR/logs"

# log NIVEL "mensaje"  ->  2026-11-02 10:15:00 [INFO] mensaje
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') [$1] $2" >> "$LOG_FILE"
}

# Mensajes con color para el usuario
ok()    { echo -e "${VERDE}✔ $1${NC}"; }
error() { echo -e "${ROJO}✘ $1${NC}"; }
aviso() { echo -e "${AMARILLO}! $1${NC}"; }

pausa() {
    echo
    read -rp "Presioná Enter para volver al menú..." _
}
