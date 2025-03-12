NAME = inception
DOCKER_COMPOSE = srcs/docker-compose.yml
DATA_PATH = /home/tkirmizi/data

all: setup start

setup:
	@mkdir -p $(DATA_PATH)/mysql
	@mkdir -p $(DATA_PATH)/wordpress

start:
	@cd srcs && docker compose -f docker-compose.yml up -d --build

stop:
	@cd srcs && docker compose -f docker-compose.yml down

clean: stop
	@docker system prune -a

fclean: clean
	@docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	@rm -rf $(DATA_PATH)

re: fclean all

.PHONY: all setup start stop clean fclean re