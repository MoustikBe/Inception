PATH_YML = ./srcs/docker-compose.yml

.PHONY: all clean fclean re

$(NAME): up

up:
		docker-compose -f $(PATH_YML) up --build

all: up

clean: 
		docker-compose -f $(PATH_YML) down -v

fclean: clean
		docker system prune -af --volumes
		rm -rf /home/misaac-c/data/wordpress/*
		rm -rf /home/misaac-c/data/mariadb/*