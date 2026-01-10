all:
	mkdir -p /home/$(USER)/data
	mkdir -p /home/$(USER)/data/db_data
	mkdir -p /home/$(USER)/data/wp_data
	cd srcs/ && docker-compose up -d

down:
	cd srcs/ && docker-compose down

clean:
	cd srcs/ && docker-compose down -v

re: down all

.PHONY : all down clean re
