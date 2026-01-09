all:
	mkdir -p /home/$(USER)/data
	mkdir -p /home/$(USER)/data/db_data
	mkdir -p /home/$(USER)/data/wp_data
	cd srcs/ && docker-compose up -d

down:
	cd srcs/ && docker-compose down

re: down all

.PHONY : all down re
