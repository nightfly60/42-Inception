#!/bin/sh

# si la db existe pas on va la créer
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "=== Première installation ==="
    echo "Initialisation de mariadb..."

    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    echo "Structure de base créée."
    echo "Configuration des utilisateurs et de la base de données..."

    /usr/bin/mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;

-- création d'un password pour le root
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';

-- création de la database
CREATE DATABASE IF NOT EXISTS \'${MYSQL_DATABASE}\';

-- création du user wordpress
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

-- on donne tous les accès au user wordpress sur la database
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';

EOF

    echo "=== Config terminée ==="
    echo "Base de données : ${MYSQL_DATABASE}"
    echo "User : ${MYSQL_USER}"
fi

echo "Démarrage de mariadb..."
exec /usr/bin/mysqld --user=mysql --console
