#!/bin/bash
# modulos/backup.sh - Tarea 1: backup comprimido + borrado de backups viejos.

hacer_backup() {
    echo -e "${AZUL}=== BACKUP DE UN DIRECTORIO ===${NC}"
    read -rp "Directorio a respaldar [$BACKUP_ORIGEN]: " origen
    origen="${origen:-$BACKUP_ORIGEN}"      # si no escribe nada, usa el de config

    # 1) Validar que el origen exista
    if [ ! -d "$origen" ]; then
        error "El directorio '$origen' no existe."
        log ERROR "Backup fallido: no existe el directorio $origen"
        return 1
    fi

    # 2) Preparar destino y nombre del archivo (con fecha y hora)
    mkdir -p "$BACKUP_DESTINO"
    local base archivo
    base="$(basename "$origen")"
    archivo="$BACKUP_DESTINO/backup_${base}_$(date +%Y%m%d_%H%M%S).tar.gz"

    # 3) Crear el .tar.gz. -C entra al directorio padre para que el
    #    archivo contenga "prueba/..." y no la ruta absoluta completa.
    if tar -czf "$archivo" -C "$(dirname "$origen")" "$base"; then
        ok "Backup creado: $archivo"
        log INFO "Backup OK: $origen -> $archivo"
    else
        error "Falló la creación del backup."
        log ERROR "Backup fallido: tar devolvió error con $origen"
        return 1
    fi

    # 4) Rotación: borrar backups viejos
    limpiar_backups_viejos
}

limpiar_backups_viejos() {
    local borrados
    # -maxdepth 1: solo esta carpeta. -name: SOLO nuestros backups.
    # -mtime +N: modificados hace más de N días.
    borrados=$(find "$BACKUP_DESTINO" -maxdepth 1 -type f -name "backup_*.tar.gz" \
               -mtime +"$DIAS_RETENCION" -print -delete | wc -l)
    if [ "$borrados" -gt 0 ]; then
        aviso "Se eliminaron $borrados backup(s) con más de $DIAS_RETENCION días."
        log INFO "Rotación: $borrados backup(s) eliminados (> $DIAS_RETENCION días)"
    else
        echo "No había backups viejos para eliminar."
        log INFO "Rotación: nada para eliminar"
    fi
}
