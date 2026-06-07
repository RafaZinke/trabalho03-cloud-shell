#!/bin/bash
# Script: 08_usuarios_permissoes.sh
# Descrição: Cria usuários e grupos do ambiente do Fórum Online
# Autor: Rafael Zink

LOG="/app/logs/usuarios.log"
mkdir -p /app/logs

configurar_usuarios() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Configurando usuários do Fórum Online..." | tee -a "$LOG"

    # Cria grupo temático
    groupadd -f forum_ops
    echo "[OK] Grupo 'forum_ops' criado." | tee -a "$LOG"

    # Cria usuário de sistema (sem login)
    if ! id "moderador_user" &>/dev/null; then
        useradd -r -g forum_ops -s /bin/false moderador_user
        echo "[OK] Usuário 'moderador_user' criado." | tee -a "$LOG"
    else
        echo "[INFO] Usuário 'moderador_user' já existe." | tee -a "$LOG"
    fi

    # Aplica permissões nos diretórios do fórum
    mkdir -p /app/forum/moderacao
    chown -R moderador_user:forum_ops /app/forum/moderacao
    chmod 750 /app/forum/moderacao
    echo "[OK] Permissões aplicadas em /app/forum/moderacao (750)" | tee -a "$LOG"

    chmod 755 /app/forum/topicos
    echo "[OK] Permissões aplicadas em /app/forum/topicos (755)" | tee -a "$LOG"

    echo "[INFO] Verificação final:" | tee -a "$LOG"
    ls -la /app/forum | tee -a "$LOG"
}

configurar_usuarios