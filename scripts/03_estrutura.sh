#!/bin/bash
# Script: 03_estrutura.sh
# Descrição: Cria a estrutura de diretórios temática do Fórum Online
# Autor: Rafael Zink

LOG="/app/logs/estrutura.log"
mkdir -p /app/logs

criar_estrutura() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Criando estrutura do Fórum Online..." | tee -a "$LOG"

    # Remove estrutura antiga com segurança
    rm -rf /app/forum

    # Cria diretórios temáticos
    mkdir -p /app/forum/topicos
    mkdir -p /app/forum/usuarios
    mkdir -p /app/forum/moderacao
    mkdir -p /app/forum/anexos
    mkdir -p /app/forum/categorias
    mkdir -p /app/forum/logs
    mkdir -p /app/forum/backups
    mkdir -p /app/forum/publicacao

    # Cria arquivos iniciais
    touch /app/forum/topicos/topicos.txt
    touch /app/forum/usuarios/usuarios.txt
    touch /app/forum/moderacao/denuncias.txt
    echo "Forum Online - Iniciado em $(date)" > /app/forum/logs/inicializacao.log

    echo "[OK] Estrutura criada com sucesso:" | tee -a "$LOG"
    ls -la /app/forum | tee -a "$LOG"
}

criar_estrutura