NAME	=	./srcs/docker-compose.yml 

start:
		docker-compose -f $(NAME) up --build

stop:
		docker-compose -f $(NAME) down -v 


PHONY: start stop