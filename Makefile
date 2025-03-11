NAME = inception
DOCKER_COMPOSE = srcs/docker-compose.yml

all: setup start

setup:
	@mkdir -p data/mysql
	@mkdir -p data/wordpress

start:
	@cd srcs && docker compose -f docker-compose.yml up -d --build

stop:
	@cd srcs && docker compose -f docker-compose.yml down

clean: stop
	@docker system prune -a

fclean: clean
	@docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	@sudo rm -rf data

re: fclean all

.PHONY: all setup start stop clean fclean re