1. Services provided by the stack
This project deploys a simple web infrastructure using Docker and Docker Compose.
The stack is composed of the following services:

Nginx: It acts as the web server. It listens on port 443 and handles HTTPS connections. It also forwards client requests to the
Wordpress service.

Wordpress: It acts as the web application (Content Management System). It runs with PHP-FPM, and generates dynamic web pages.
It also communicates with the MariaDB database to store data (e.g. users).

MariaDB: It acts as the database so we can store all Wordpress data such as users, posts and settings. It is accessible only from the Wordpress container.

Each service runs in its own Docker container and communicates through a Docker network.


2. Start and stop the project
Start the project
From the root directory of the project, run:
```
make # docker-compose up -d
```
The Makefile will create the data (volumes) directories, build the images, start all the containers in detached mode.

Stop the project
To stop the containers without deleting data:
```
make down # docker-compose down
```
To stop the containers and remove the volumes (data loss):
```
make clean # docker-compose down -v
```

3. Access the website and administration panel
Website access
Open a web browser and go to: https://edurance.42.fr (replace de "edurance" login by yours configured in the .env)

Wordpress administration panel
Access the admin interface at: https://edurance.42.fr/wp-admin (replace de "edurance" login by yours configured in the .env)
Log in using the Wordpress administrator credentials.


4. Locate and manage credentials
All credentials are defined using environment variables. Credentials can be found in .env at the root of the project (self configured).
Exemple variables:
- Database name
- Database user and password
- Wordpress admin username and password


5. Check that services are running correctly
To check running containers, run:
```
docker ps
```
You should see the nginx, mariadb and wordpress containers running.

To check container logs, run:
```
docker logs <container_name> # mariadb, nginx or wordpress
```
