FROM alpine:3.19

# installation mariadb et du client (pas de cache)
RUN apk update && apk add --no-cache mariadb mariadb-client

# creation des dossiers -> socket, logs
RUN mkdir -p /var/lib/mysql /run/mysqld /var/log/mysql

# change le proprietaire des dossiers pour le user de la config -> mysql
RUN chown -R mysql:mysql /var/lib/mysql /run/mysqld /var/log/mysql

# donne tous les droits sur le run
RUN chmod 777 /run/mysqld

# copie le fichier de config
COPY ./conf/my.cnf /etc/my.cnf

# copie le script d'installation
COPY ./tools/setup.sh /usr/local/bin/setup.sh

# rend le script d'installation executable
RUN chmod +x /usr/local/bin/setup.sh

# lance le script d'installation au demarrage du container
ENTRYPOINT ["/usr/local/bin/setup.sh"]
