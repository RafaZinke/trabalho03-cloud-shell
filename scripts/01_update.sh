#!/bin/bash
# Script: 01_update.sh
# Descrição: Atualiza os pacotes do sistema Linux do servidor do Fórum Online
# Autor: Rafael Zink

LOG="/app/logs/update.log"
mkdir -p /app/logs

atualizar_sistema() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Iniciando atualização do sistema..." | tee -a "$LOG"
    
    apt update -y >> "$LOG" 2>&1
    if [ $? -eq 0 ]; then
        echo "[OK] apt update concluído." | tee -a "$LOG"
    else
        echo "[ERRO] Falha no apt update." | tee -a "$LOG"
        exit 1
    fi

    apt upgrade -y >> "$LOG" 2>&1
    if [ $? -eq 0 ]; then
        echo "[OK] Pacotes atualizados com sucesso." | tee -a "$LOG"
    else
        echo "[ERRO] Falha ao atualizar pacotes." | tee -a "$LOG"
        exit 1
    fi

    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Atualização finalizada." | tee -a "$LOG"
}

atualizar_sistema