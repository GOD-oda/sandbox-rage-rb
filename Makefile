.PHONY: build
build:
	docker compose build --no-cache

.PHONY: down
down:
	docker compose down --remove-orphans

.PHONY: up
up:
	docker compose up -d

.PHONY: restart
restart:
	@make down
	@make up

.PHONY: app.logs
app.logs:
	docker compose logs -f app
