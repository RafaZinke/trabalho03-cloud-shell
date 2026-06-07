# Trabalho 03 - Linux, Shell Script e Cloud Computing

## Aluno

Rafael Zink - 7ª Fase - Sistemas de Informação - Unidavi

## Tema

Infraestrutura para um Fórum Online

## Descrição do Projeto

Ambiente Linux containerizado com Ubuntu Server simulando a infraestrutura de um fórum online. O projeto automatiza tarefas operacionais como atualização do sistema, instalação de serviços, backup, deploy e monitoramento, utilizando Shell Script e Docker.

GITHUB - https://github.com/RafaZinke/trabalho03-cloud-shell

## Tecnologias Utilizadas

- Ubuntu 22.04
- Docker e Docker Compose
- Apache2
- Shell Script (Bash)
- GitHub
- DockerHub

## Estrutura do Projeto

```
trabalho03-cloud-shell/
├── Dockerfile
├── docker-compose.yml
├── README.md
├── scripts/
│   ├── 01_update.sh
│   ├── 02_apache.sh
│   ├── 03_estrutura.sh
│   ├── 04_backup.sh
│   ├── 05_deploy.sh
│   ├── 06_processos.sh
│   ├── 07_monitoramento.sh
│   ├── 08_usuarios_permissoes.sh
│   ├── 09_relatorio.sh
│   └── menu.sh
├── source/
│   ├── index.html
│   └── sobre.html
├── backups/
├── logs/
└── evidencias/
```

## Como Executar

```bash
docker compose up -d --build
docker exec -it trabalho03-linux bash
```

## Scripts Disponíveis

| Script | Descrição |
|---|---|
| 01_update.sh | Atualiza os pacotes do sistema |
| 02_apache.sh | Instala e valida o Apache |
| 03_estrutura.sh | Cria os diretórios do projeto |
| 04_backup.sh | Gera backup compactado em .tar.gz |
| 05_deploy.sh | Publica os arquivos no Apache |
| 06_processos.sh | Gerencia processos do sistema |
| 07_monitoramento.sh | Monitora CPU, memória, disco e Apache |
| 08_usuarios_permissoes.sh | Cria usuários, grupos e aplica permissões |
| 09_relatorio.sh | Gera relatório operacional completo |
| menu.sh | Menu interativo com acesso a todos os scripts |

## Como Executar os Scripts

Dentro do container:

```bash
cd /app/scripts
bash 01_update.sh
bash 02_apache.sh
bash 03_estrutura.sh
bash 04_backup.sh
bash 05_deploy.sh
bash 07_monitoramento.sh
bash 09_relatorio.sh
```

Para o gerenciamento de processos:

```bash
bash 06_processos.sh listar
bash 06_processos.sh buscar apache
bash 06_processos.sh matar 1234
```

## Como Executar o Menu Principal

```bash
bash /app/scripts/menu.sh
```

## Como Acessar o Site no Navegador

Com o container em execução, acesse:

```
http://localhost:8080
```

## DockerHub

https://hub.docker.com/r/rafaelzink/trabalho03-forum

## Evidências

As evidências estão na pasta `evidencias/` do repositório, com prints de cada etapa executada.

## Dificuldades Encontradas

A principal dificuldade foi a configuração dos timeouts do Docker na primeira execução, onde o daemon não estava iniciado corretamente. Também foi necessário ajustar o atributo `version` do docker-compose.yml, que estava obsoleto na versão atual do Docker Compose.