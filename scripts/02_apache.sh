#!/bin/bash
# Script: 02_apache.sh
# Descrição: Instala, inicia e valida o Apache para o servidor do Fórum Online
# Autor: Rafael Zink

LOG="/app/logs/apache.log"
mkdir -p /app/logs

instalar_apache() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Instalando Apache..." | tee -a "$LOG"
    apt install -y apache2 >> "$LOG" 2>&1
    echo "[OK] Apache instalado." | tee -a "$LOG"
}

verificar_apache() {
    if service apache2 status > /dev/null 2>&1; then
        echo "[OK] Apache está em execução." | tee -a "$LOG"
    else
        echo "[INFO] Iniciando Apache..." | tee -a "$LOG"
        service apache2 start >> "$LOG" 2>&1
    fi
}

versao_apache() {
    VERSAO=$(apache2 -v 2>/dev/null | head -1)
    echo "[INFO] Versão instalada: $VERSAO" | tee -a "$LOG"
}

instalar_apache
verificar_apache
versao_apache