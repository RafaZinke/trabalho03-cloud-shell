#!/bin/bash
# Script: 04_backup.sh
# Descrição: Gera backup compactado da estrutura do Fórum Online
# Autor: Rafael Zink

LOG="/app/logs/backup.log"
DIR_ORIGEM="/app/forum"
DIR_DESTINO="/app/backups"
DATA=$(date '+%Y-%m-%d_%H-%M')
ARQUIVO="backup_forum_${DATA}.tar.gz"

mkdir -p "$DIR_DESTINO"
mkdir -p /app/logs

realizar_backup() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Iniciando backup do Fórum Online..." | tee -a "$LOG"

    if [ ! -d "$DIR_ORIGEM" ]; then
        echo "[AVISO] Diretório de origem não encontrado: $DIR_ORIGEM" | tee -a "$LOG"
        echo "[INFO] Execute 03_estrutura.sh primeiro." | tee -a "$LOG"
        exit 1
    fi

    tar -czf "${DIR_DESTINO}/${ARQUIVO}" "$DIR_ORIGEM" >> "$LOG" 2>&1

    if [ -f "${DIR_DESTINO}/${ARQUIVO}" ]; then
        echo "[OK] Backup gerado: ${ARQUIVO}" | tee -a "$LOG"
        ls -lh "${DIR_DESTINO}/${ARQUIVO}" | tee -a "$LOG"
    else
        echo "[ERRO] Falha ao gerar o backup." | tee -a "$LOG"
        exit 1
    fi
}

realizar_backup