#!/bin/bash
# Script: 07_monitoramento.sh
# Descrição: Monitora recursos do servidor do Fórum Online
# Autor: Rafael Zink

LOG="/app/logs/monitoramento.log"
mkdir -p /app/logs

monitorar() {
    echo "=========================================="
    echo "  MONITORAMENTO - FÓRUM ONLINE"
    echo "  $(date '+%Y-%m-%d %H:%M:%S')"
    echo "==========================================" | tee -a "$LOG"

    # CPU
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
    echo "[CPU] Uso: ${CPU}%" | tee -a "$LOG"
    if (( $(echo "$CPU > 80" | bc -l) )); then
        echo "[ALERTA] Uso de CPU acima de 80%!" | tee -a "$LOG"
    fi

    # Memória
    MEM=$(free | awk '/Mem/ {printf "%.0f", $3/$2*100}')
    echo "[MEM] Uso de memória: ${MEM}%" | tee -a "$LOG"
    if [ "$MEM" -gt 80 ]; then
        echo "[ALERTA] Uso de memória acima de 80%!" | tee -a "$LOG"
    fi

    # Disco
    DISCO=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
    echo "[DISCO] Uso do disco: ${DISCO}%" | tee -a "$LOG"
    if [ "$DISCO" -gt 80 ]; then
        echo "[ALERTA] Disco acima de 80%!" | tee -a "$LOG"
    fi

    # Apache
    if service apache2 status > /dev/null 2>&1; then
        echo "[OK] Apache em execução." | tee -a "$LOG"
    else
        echo "[ALERTA] Apache NÃO está em execução!" | tee -a "$LOG"
    fi
}

monitorar