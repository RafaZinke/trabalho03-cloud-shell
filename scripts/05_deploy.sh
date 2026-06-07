#!/bin/bash
# Script: 05_deploy.sh
# Descrição: Publica os arquivos do Fórum Online no Apache
# Autor: Rafael Zink

LOG="/app/logs/deploy.log"
DIR_ORIGEM="/app/source"
DIR_DESTINO="/var/www/html"

mkdir -p /app/logs

realizar_deploy() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Iniciando deploy do Fórum Online..." | tee -a "$LOG"

    # Limpa destino
    rm -rf ${DIR_DESTINO}/*
    echo "[OK] Diretório de destino limpo." | tee -a "$LOG"

    # Copia arquivos
    cp -r ${DIR_ORIGEM}/* ${DIR_DESTINO}/
    echo "[OK] Arquivos copiados para ${DIR_DESTINO}" | tee -a "$LOG"

    # Valida index.html
    if [ -f "${DIR_DESTINO}/index.html" ]; then
        echo "[OK] index.html encontrado no destino." | tee -a "$LOG"
    else
        echo "[ERRO] index.html não encontrado após deploy!" | tee -a "$LOG"
        exit 1
    fi

    echo "[INFO] Arquivos publicados:" | tee -a "$LOG"
    ls -la ${DIR_DESTINO} | tee -a "$LOG"
}

realizar_deploy