#!/bin/bash
# Script: menu.sh
# Descrição: Menu interativo principal do ambiente do Fórum Online
# Autor: Rafael Zink

SCRIPTS_DIR="/app/scripts"

mostrar_menu() {
    clear
    echo "=========================================="
    echo "  Criado por: Rafael Zink"
    echo "  Instituição: Unidavi - 7ª Fase SI"
    echo "  Tema: Infraestrutura para Fórum Online"
    echo "=========================================="
    echo "       MENU DEVOPS CLOUD - FÓRUM"
    echo "=========================================="
    echo "  1 - Atualizar sistema"
    echo "  2 - Instalar Apache"
    echo "  3 - Criar estrutura do projeto"
    echo "  4 - Realizar backup"
    echo "  5 - Fazer deploy"
    echo "  6 - Ver processos"
    echo "  7 - Monitorar sistema"
    echo "  8 - Configurar usuários e permissões"
    echo "  9 - Gerar relatório"
    echo "  0 - Sair"
    echo "=========================================="
    echo -n "  Escolha uma opção: "
}

while true; do
    mostrar_menu
    read OPCAO
    case "$OPCAO" in
        1) bash ${SCRIPTS_DIR}/01_update.sh ;;
        2) bash ${SCRIPTS_DIR}/02_apache.sh ;;
        3) bash ${SCRIPTS_DIR}/03_estrutura.sh ;;
        4) bash ${SCRIPTS_DIR}/04_backup.sh ;;
        5) bash ${SCRIPTS_DIR}/05_deploy.sh ;;
        6)
            echo "Uso: listar / buscar <nome> / matar <PID>"
            echo -n "Ação: "
            read ACAO
            bash ${SCRIPTS_DIR}/06_processos.sh $ACAO
        ;;
        7) bash ${SCRIPTS_DIR}/07_monitoramento.sh ;;
        8) bash ${SCRIPTS_DIR}/08_usuarios_permissoes.sh ;;
        9) bash ${SCRIPTS_DIR}/09_relatorio.sh ;;
        0) echo "Saindo..."; exit 0 ;;
        *) echo "[ERRO] Opção inválida." ;;
    esac
    echo ""
    echo "Pressione ENTER para voltar ao menu..."
    read
done