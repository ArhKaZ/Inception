NAME	=	./srcs/docker-compose.yml 

COMP	=	docker-compose	-f

STOP	=	stop

UP		=	up -p Inception -d --build

DOWN	=	down -v

CLEAR	=	docker system prune -af

all: up

up:
	$(COMP) $(NAME) $(UP)

stop:
	$(COMP) $(NAME) $(STOP)

down:
	$(COMP) $(NAME) $(DOWN)

fclean:
	$(CLEAR)

clean:
	$(COMP) $(NAME) $(DOWN)

.PHONY: all fclean clean stop down up
