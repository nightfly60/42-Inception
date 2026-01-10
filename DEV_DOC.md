1. Environment setupd from scratch
Prerequisites
The following tools must be installed on the host machine:
- Docker
- Docker Compose
- Make
- OpenSSL (SSL certificates)
- Linux

Project structure
```
.
|-- Makefile
`-- srcs
    |-- docker-compose.yml
    `-- requirements
        |-- mariadb/
        |-- nginx/
        |-- wordpress/
```

Environment variables
The project uses a .env file to store configuration values and secrets.
Here an exemple of a .env file:
```
MYSQL_ROOT_PASSWORD=XXXX
MYSQL_DATABASE=XXXX
MYSQL_USER=XXXX
MYSQL_PASSWORD=XXXX

WORDPRESS_DB_HOST=mariadb:3306
WORDPRESS_DB_NAME=XXXX
WORDPRESS_DB_USER=XXXX
WORDPRESS_DB_PASSWORD=XXXX

LOGIN=XXXX

ADMIN_LOGIN=XXXX
ADMIN_PASS=XXXX
USER_LOGIN=XXXX
USER_PASS=XXXX
```


2. Build and launch the project
Here are the rules of the Makefile:
```
make # docker-compose up -d (to start the containers)
make down # docker-compose down (to stop the containers)
make clean # docker-compose down -v (to stop the containers and remove the volumes -> data loss)
make re # make down & make
```


3. Managing containers and volumes
List running containers
```
docker ps
```

Inspect containers (check configuration, creating etc.)
```
docker inspect <container_name>
```

Access container shell
```
docker exec -it <container_name> sh
```

View container logs
```
docker logs <container_name>
```

List docker volumes
```
docker volume ls
docker volumes list
```

Inspect a volume
```
docker volume inspect VOLUME <volume_name>
```

Remove unused volumes
```
docker volume prune
```


4. Data persistence
The project uses Docker volumes to ensure data persistence.

Data locations
In this project, volumes are stored in ``/home/login/data``.
- MariaDB data stores all the database files and is persisted via a Docker volume.
- Wordpress files stores all the website files and uploads and are persisted via a Docker volume.
These volumes ensure that data is preserved even if containers are stopped or rebuilt.

Volume behavior
- Containers can be safely recreated without data loss.
- Data is deleted only if volumes are explicitly removed ``make clean`` or ``docker-compose down -v``.
