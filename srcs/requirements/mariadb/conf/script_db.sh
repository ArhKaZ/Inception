#!/bin/bash
service mysql start
# Attendre que MariaDB soit prêt
while ! mysqladmin ping --silent; do
    sleep 1
done

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';" > db.sql

mysql -u root -p$SQL_ROOT_PASSWORD < db.sql

echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" > db.sql
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" >> db.sql
echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%';" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql


kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
