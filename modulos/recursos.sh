#!/bin/bash
# modulos/recursos.sh - Tarea 2: informe de CPU, memoria y disco en un log.
# LC_ALL=C fuerza idioma/formato estándar: sin esto, en un sistema en
# español "free" muestra "Memoria:" en vez de "Mem:" y el awk no encuentra nada.

generar_informe() {
    echo -e "${AZUL}=== INFORME DE RECURSOS ===${NC}"
    local cpu mem disco informe_log fecha
    informe_log="$DIR/logs/informe_recursos.log"
    fecha="$(date '+%Y-%m-%d %H:%M:%S')"

    # CPU en uso = us (usuario) + sy (sistema), de la línea "%Cpu(s)" de top
    cpu=$(LC_ALL=C top -bn1 | grep "Cpu(s)" | awk '{printf "%.1f", $2 + $4}')

    # Memoria: columnas total ($2) y usada ($3) de la línea "Mem:"
    mem=$(LC_ALL=C free -m | awk '/^Mem:/ {printf "%d MB usados de %d MB (%.1f%%)", $3, $2, $3*100/$2}')

    # Disco raíz: usado ($3), total ($2) y porcentaje ($5) de la 2da línea
    disco=$(LC_ALL=C df -h / | awk 'NR==2 {print $3 " usados de " $2 " (" $5 ")"}')

    {
        echo "===== Informe $fecha ====="
        echo "CPU en uso : ${cpu}%"
        echo "Memoria    : $mem"
        echo "Disco (/)  : $disco"
        echo
    } | tee -a "$informe_log"

    ok "Informe guardado en $informe_log"
    log INFO "Informe generado: CPU ${cpu}% | Mem $mem | Disco $disco"
}
