FROM debian:buster
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y wget curl gnupg2 lsb-release
RUN wget https://packages.sury.org/php/apt.gpg && apt-key add apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt update -y && apt install -y php8.3 php8.3-mysql php8.3-fpm mariadb-client
RUN wget https://fr.wordpress.org/wordpress-6.4.3-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.4.3-fr_FR.tar.gz && rm wordpress-6.4.3-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress
COPY conf/www.conf /etc/php82/php-fpm.d/www.conf
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY conf/auto_config.sh /auto_config.sh
RUN chmod +x /auto_config.sh
RUN mkdir -p /run/php 
ENTRYPOINT [ "/auto_config.sh" ]
CMD ["/usr/sbin/php-fpm8.3", "-F", "--allow-root"]