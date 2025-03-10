NAME = inception
DOCKER_COMPOSE = srcs/docker-compose.yml

all: setup_start

setup:
	@mkdir mysql
	@mkdir wordpress

start:
	@cd srcs && docker-compose -f $(DOCKER_COMPOSE_FILE) up -d --build

stop:
	@cd srcs && docker-compose -f $(DOCKER_COMPOSE_FILE) down

clean: stop
	@docker system prune -a
	# volume and other data removing gonna add

fclean: clean
	# @docker volume rm // gonna add

re: fclean all