# Caso queira utilizar em BASH, descomente a próxima linha:
# SHELL := /bin/bash

UID := $(shell id -u)
GID := $(shell id -g)

export UID
export GID

# === Containers ===
dev:
	@echo "🚀 Subindo ambiente de desenvolvimento..."
	@echo ""
# 	@set -a && source .env.dev && set +a && UID=$(UID) GID=$(GID) 
# 	docker compose -f compose.dev.yml up --build
	docker compose up --build

down-dev:
	@echo "🛑 Parando containers de desenvolvimento..."
	@echo ""
# 	docker compose -f compose.dev.yml down
	docker compose down
	
logs-dev:
	docker compose -f compose.dev.yml logs -f

prod:
	@echo "🚀 Subindo ambiente de produção..."
	@set -a && source .env.prod && set +a && docker compose -f compose.prod.yml up -d --build

down-prod:
	@echo "🛑 Parando containers de produção..."
	docker compose -f compose.prod.yml down


logs-prod:
	docker compose -f compose.prod.yml logs


# === Scripts de workflow ===
backup:
	@echo "💾 Executando backup..."
	@bash scripts/backup.sh

fim:
	@echo "🌙 Encerrando expediente..."
	@bash scripts/fim_de_expediente.sh





