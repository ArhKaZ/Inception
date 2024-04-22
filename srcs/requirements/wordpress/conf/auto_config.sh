#!/bin/sh
sleep 7 # Pour être sûr que tout est lancé dans mariadb
chmod -R 775 /var/www/wordpress;
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    if [ ! "$(ls -A /var/www/wordpress)" ]; then 
        wp core download --path=$PATH_WD --allow-root
    fi
    wp config create --dbname=$SQL_DATABASE \
                     --dbuser=$SQL_USER \
                     --dbpass=$SQL_PASSWORD \
                     --dbhost=mariadb:3306 \
                     --path=$PATH_WD \
                     --allow-root \

    wp core install --url=syluiset.42.fr \
                    --title=syluisetWordpress \
                    --admin_user=$WD_ADMIN_NAME \
                    --admin_password=$WD_ADMIN_PASSWORD \
                    --admin_email=$WD_ADMIN_MAIL \
                    --allow-root \
                    --path=$PATH_WD

    wp user create $WD_USER $WD_USERMAIL \
                   --user_pass=$WD_USER_PASS \
                   --role=contributor \
                   --allow-root \
                   --path=$PATH_WD
fi

mkdir -p /run/php/
/usr/sbin/php-fpm7.3 -F 