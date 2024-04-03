FROM debian:buster
RUN apt update -y
RUN apt upgrade -y
RUN apt-get install curl -y
RUN apt-get install vim -y
RUN apt-get install mariadb-server -y
COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY conf/script_db.sh /tmp/script_db.sh
RUN chmod +x /tmp/script_db.sh
ENTRYPOINT ["/tmp/script_db.sh"]