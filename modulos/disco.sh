#!/bin/bash
# modulos/disco.sh - Tarea 3: alerta cuando una partición supera el umbral.

controlar_disco() {
    echo -e "${AZUL}=== CONTROL DE ESPACIO EN DISCO (umbral: ${UMBRAL_DISCO}%) ===${NC}"
    local punto uso alertas=0

    # df --output=target,pcent  -> punto de montaje y % de uso
    # tail -n +2 salta la cabecera. Excluimos sistemas de archivos virtuales.
    # "done < <(...)" evita el subshell que perdería la variable "alertas".
    while read -r punto uso; do
        uso="${uso%\%}"                       # quita el símbolo %
        [[ "$uso" =~ ^[0-9]+$ ]] || continue  # ignora si no es un número

        if [ "$uso" -gt "$UMBRAL_DISCO" ]; then
            aviso "ALERTA: $punto está al ${uso}% (umbral ${UMBRAL_DISCO}%)"
            log WARN "Disco: $punto al ${uso}% supera el umbral de ${UMBRAL_DISCO}%"
            alertas=$((alertas + 1))
        else
            ok "$punto al ${uso}%"
            log INFO "Disco: $punto al ${uso}% (OK)"
        fi
    done < <(LC_ALL=C df --output=target,pcent -x tmpfs -x devtmpfs -x squashfs | tail -n +2)

    echo
    if [ "$alertas" -gt 0 ]; then
        error "$alertas partición(es) por encima del umbral."
    else
        ok "Todas las particiones están por debajo del umbral."
    fi
}
