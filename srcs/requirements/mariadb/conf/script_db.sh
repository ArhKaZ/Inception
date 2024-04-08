#!/bin/sh
# service mysql start;
# mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
# mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" 
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
# mysql -u root -p$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
# exec mysqld_safe

service mysql start;
mysql -e "CREATE DATABASE IF NOT EXISTS wd;"
mysql -e "CREATE USER IF NOT EXISTS 'syluiset'@'localhost' IDENTIFIED BY 'cc';"
mysql -e "GRANT ALL PRIVILEGES ON wd.* TO 'syluiset'@'%' IDENTIFIED BY 'cc';" 
mysql -e "FLUSH PRIVILEGES;"
# mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('123');"
# mysql -uroot -p'123' -e "FLUSH PRIVILEGES;"
mysqladmin -u root shutdown
exec mysqld_safe