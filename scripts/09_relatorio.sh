#!/bin/bash
# Script: 09_relatorio.sh
# Descrição: Gera relatório operacional completo do Fórum Online
# Autor: Rafael Zink

mkdir -p /app/logs
RELATORIO="/app/logs/relatorio_execucao.txt"

gerar_relatorio() {
    {
    echo "=========================================="
    echo "  RELATÓRIO OPERACIONAL - FÓRUM ONLINE"
    echo "  Aluno: Rafael Zink"
    echo "  Instituição: Unidavi"
    echo "  Data: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "=========================================="

    echo ""
    echo "--- ESPAÇO EM DISCO ---"
    df -h

    echo ""
    echo "--- USO DOS DIRETÓRIOS DO FÓRUM ---"
    du -sh /app/forum/* 2>/dev/null || echo "Estrutura não criada."

    echo ""
    echo "--- STATUS DO APACHE ---"
    service apache2 status 2>/dev/null || echo "Apache não instalado/iniciado."

    echo ""
    echo "--- ÚLTIMOS BACKUPS ---"
    ls -lht /app/backups/ 2>/dev/null | head -5 || echo "Nenhum backup encontrado."

    echo ""
    echo "--- ÚLTIMOS LOGS ---"
    ls -lht /app/logs/ 2>/dev/null | head -10

    echo ""
    echo "--- ARQUIVOS PUBLICADOS NO APACHE ---"
    ls -la /var/www/html/ 2>/dev/null || echo "Nenhum arquivo publicado."

    echo ""
    echo "--- USUÁRIOS E GRUPOS ---"
    grep "forum_ops\|moderador_user" /etc/group /etc/passwd 2>/dev/null || echo "Usuários não configurados."

    echo ""
    echo "=========================================="
    echo "  Relatório gerado em: $(date)"
    echo "=========================================="
    } | tee "$RELATORIO"

    echo ""
    echo "[OK] Relatório salvo em: $RELATORIO"
}

gerar_relatorio