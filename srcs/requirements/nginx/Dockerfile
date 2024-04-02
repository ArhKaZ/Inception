FROM alpine:3.19
RUN apk update
RUN apk add nginx
RUN apk add vim
RUN apk add curl
RUN mkdir -p /etc/nginx/ssl /var/run/nginx /var/www/html
# req -x509 pour le type de certificat, ici auto signer
RUN apk add openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/L=Lyon/O=42/OU=42/CN=syluiset.42.fr/UID=syluiset" 
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html
RUN chown -R nginx:nginx /var/www/html
CMD [ "nginx", "-g", "daemon off;"]