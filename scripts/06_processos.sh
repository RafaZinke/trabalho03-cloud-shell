#!/bin/bash
# Script: 06_processos.sh
# Descrição: Gerencia processos do servidor do Fórum Online
# Uso: ./06_processos.sh [listar|buscar <nome>|matar <PID>]
# Autor: Rafael Zink

listar_processos() {
    echo "===== PROCESSOS ATIVOS NO SERVIDOR DO FÓRUM ====="
    ps aux --sort=-%mem | head -20
}

buscar_processo() {
    local NOME="$1"
    echo "===== BUSCANDO PROCESSO: $NOME ====="
    ps aux | grep "$NOME" | grep -v grep
}

matar_processo() {
    local PID="$1"
    if [ -z "$PID" ]; then
        echo "[ERRO] Informe o PID. Uso: ./06_processos.sh matar <PID>"
        exit 1
    fi
    if ! [[ "$PID" =~ ^[0-9]+$ ]]; then
        echo "[ERRO] PID inválido: '$PID'. Informe um número."
        return 1
    fi
    echo "[AVISO] Encerrando processo PID $PID..."
    kill "$PID" && echo "[OK] Processo $PID encerrado." || echo "[ERRO] Não foi possível encerrar o processo $PID."
}

case "$1" in
    listar) listar_processos ;;
    buscar) buscar_processo "$2" ;;
    matar)  matar_processo "$2" ;;
    *)
        echo "Uso: ./06_processos.sh [listar | buscar <nome> | matar <PID>]"
        exit 1
    ;;
esac