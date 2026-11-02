#!/bin/bash
# ============================================================
# mantenimiento.sh - Script principal con menú interactivo
# Tareas: 1) Backup  2) Informe de recursos  3) Control de disco
# ============================================================

# Carpeta donde vive el script (así funciona se ejecute desde donde se ejecute)
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$DIR/config.conf"
source "$DIR/lib/utils.sh"
source "$DIR/modulos/backup.sh"
source "$DIR/modulos/recursos.sh"
source "$DIR/modulos/disco.sh"

mostrar_menu() {
    clear
    echo -e "${AZUL}╔════════════════════════════════════════╗${NC}"
    echo -e "${AZUL}║     MANTENIMIENTO DEL SISTEMA  v1.0    ║${NC}"
    echo -e "${AZUL}╚════════════════════════════════════════╝${NC}"
    echo -e "  ${VERDE}1)${NC} Backup de un directorio"
    echo -e "  ${VERDE}2)${NC} Informe de recursos (CPU / memoria / disco)"
    echo -e "  ${VERDE}3)${NC} Control de espacio en disco"
    echo -e "  ${ROJO}0)${NC} Salir"
    echo
}

log INFO "Script iniciado"

while true; do
    mostrar_menu
    read -rp "Elegí una opción [0-3]: " opcion
    echo
    case "$opcion" in
        1) hacer_backup;     pausa ;;
        2) generar_informe;  pausa ;;
        3) controlar_disco;  pausa ;;
        0) ok "Hasta luego."; log INFO "Script finalizado"; exit 0 ;;
        *) error "Opción inválida: '$opcion'. Ingresá un número del 0 al 3."; pausa ;;
    esac
done
