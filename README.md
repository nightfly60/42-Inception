This project has been created as part of the 42 curriculum by edurance (elena).

Description:
Inception aims to create an administration system using Docker. The goal is to use containers and deploy several services using Docker images in order to ensure
modularity and ease of deployment. The project involves building and configuring Docker images for different servces: nginx (web server),
wordpress (content managment system) and mariadb (database). These services are designed to work together.

Instructions:
To install, you need to clone the repository. Then, configure your .env file at the root of the project.
Here is an exemple of a .env:
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
Then, you can use the following commands to run and stop the containers.
```
make # start the containers
make down # stop the containers
make clean # stop the containers and remove the volumes
make re # down and up
```

Resources:
Here some documentation for Docker, wordpress and nginx:
- https://docs.docker.com/ (official Docker docs website)
- https://www.hostinger.com/tutorials/how-to-use-wordpress (how to use wordpress)
- https://nginx.org/en/docs/ (nginx docs and tutorials)
- https://hub.docker.com/_/nginx (the official build for nginx with good exemples)

Use of Artificial Intelligence:
AI tools were used during this prokect as a support for understanding concepts and issues.

Project description:
Use of Docker:
This project uses Docker to containerize and deploy multiple services in an isolated and reproducible environment. Docker allows each service (nginx, wordpress, and mariadb) to run in its own container with its own dependencies.
The services are orchestrated using Docker Compose, which defines how containers interact, share networks, and use persistent storage.

Included services and sources:
Nginx: acts as a web server.
WordPress: serves as the content management system.
MariaDB: provides the database for WordPress.
For the Docker images, I started from the official Alpine image and wrote all the Dockerfiles myself, configuring each service manually

Main Design choices:
Each service runs in a separate container to ensure modularity and isolation.
Services communicate through a custom Docker network, avoiding direct exposure to the host network (bridge).
Persistent data is stored using Docker volumes to ensure data durability.
Sensitive information is managed using environment variables loaded from a configurated .env file.

Technical Comparisons;
Virtual Machines vs Docker
-> Virtual Machines run a full operating system with dedicated resources, leading to higher overhead.
-> Docker containers share the host OS kernel, making them lighter, faster to start, and more resource-efficient.
Choice: Docker was chosen for its performance, lightweight nature, and ease of deployment.

Secrets vs Environment Variables
-> Secrets are designed for secure storage and encrypted handling of sensitive data.
-> Environment Variables are simpler and suitable for small-scale projects, allowing easy configuration without hardcoding credentials.
Choice: Environment variables were used due to project constraints and simplicity.

Docker Network vs Host Network
-> Docker Network provides isolation and communication between containers.
-> Host Network exposes containers directly to the host’s network, reducing isolation and increasing security risks.
Choice: A custom Docker network was used to improve security and isolation.

Docker Volumes vs Bind Mounts
-> Docker Volumes are managed by Docker and offer better portability and safety.
-> Bind Mounts depend on the host filesystem structure and are less portable.
Choice: Docker volumes were used for database and wordpress data.
