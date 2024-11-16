# makefiles/local.mk
.PHONY: up down build shell migrate fresh seed npm-install npm-dev npm-watch

up:
	docker-compose up -d

down:
	docker-compose down

build:
	docker-compose build

shell:
	docker-compose exec app bash

migrate:
	docker-compose exec app php artisan migrate

fresh:
	docker-compose exec app php artisan migrate:fresh

seed:
	docker-compose exec app php artisan db:seed

npm-install:
	docker-compose exec node npm install

npm-dev:
	docker-compose exec node npm run dev

npm-watch:
	docker-compose exec node npm run watch