FROM debian:buster
RUN apt update -y
RUN apt upgrade -y
RUN apt-get install curl -y
RUN apt-get install vim -y
RUN apt-get install mariadb-server -y
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/script_db.sh /script_db.sh
RUN chmod +x /script_db.sh
# ENTRYPOINT ["/script_db.sh"]