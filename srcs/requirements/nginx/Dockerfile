FROM debian:buster
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx -y
RUN apt-get install vim -y
RUN apt-get install curl -y
RUN mkdir -p /etc/nginx/ssl /var/run/nginx /var/www/html
# req -x509 pour le type de certificat, ici auto signer
RUN apt-get install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/L=Lyon/O=42/OU=42/CN=syluiset.42.fr/UID=syluiset" 
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
CMD [ "nginx", "-g", "daemon off;"]