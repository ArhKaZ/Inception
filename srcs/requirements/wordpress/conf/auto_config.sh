sleep 10 // Pour etre sur que tout est lancer dans mariadb
wp config create --allow-root \
                --dbname=$SQL_DATABASE \
                --dbuser=$SQL_USER \
                --dbpass=$SQL_PASSWORD \
                --dbhost=mariadb:3306 --path='var/ww/wordpress'
wp core install --url=syluiset.42.fr --title=syluisetWordpress --admin_user=$WD_ADMIN_NAME --admin_email=$WD_ADMIN_MAIL --admin_password=$WD_ADMIN_PASSWORD
wp user create $WD_USER $WD_USERMAIL --user_pass=$WD_USER_PASS