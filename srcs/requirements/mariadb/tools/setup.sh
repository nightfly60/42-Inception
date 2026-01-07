#!/bin/sh
set -e

# si la db existe pas on va la créer
if [ ! -d "/var/lib/mysql/mysql" ]; then

    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    mysqld_safe --skip-networking &
    pid="$!"
    sleep 5

    mysql -u root <<EOF

-- création d'un password pour le root
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';

-- création de la database
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};

-- création du user wordpress
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

-- on donne tous les accès au user wordpress sur la database
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';

FLUSH PRIVILEGES;

EOF

    mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
    wait "$pid"

fi

exec mysqld_safe --user=mysql --console
