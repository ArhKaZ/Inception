FROM alpine:3.19
RUN apk update
RUN apk upgrade
RUN apk add wget
RUN apk add php php-fpm mariadb-client
RUN wget https://fr.wordpress.org/wordpress-6.4.3-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.4.3-fr_FR.tar.gz && rm wordpress-6.4.3-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress
COPY conf/www.conf /etc/php82/php-fpm.d/www.conf
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY conf/auto_config.sh /tmp/auto_config.sh
RUN mkdir -p /run/php 
ENTRYPOINT [ "/tmp/auto_config.sh" ]
RUN /usr/sbin/php-fpm82 -F