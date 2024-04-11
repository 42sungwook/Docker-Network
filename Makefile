all:
	mkdir -p /Users/sungwook/data/www
	mkdir -p /Users/sungwook/data/mysql
	docker-compose -f ./srcs/docker-compose.yml up --detach

build:
	mkdir -p /Users/sungwook/data/www
	mkdir -p /Users/sungwook/data/mysql
	docker-compose -f ./srcs/docker-compose.yml up --detach --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

re: down
	docker-compose -f ./srcs/docker-compose.yml up --detach --build

clean: down
	docker system prune -a

fclean:
	docker-compose -f ./srcs/docker-compose.yml down -v
	docker system prune --all --force --volumes
	sudo rm -rf /Users/sungwook/data

.PHONY	: all build down re clean fclean