FROM alpine:3.19
RUN apk update
RUN apk upgrade
RUN apk add curl
RUN apk add vim
RUN apk add mariadb
# pour configurer
RUN apk add zsh
RUN apk add git
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY conf/script_db.sh /tmp/script_db.sh
RUN chmod +x /tmp/script_db.sh
ENTRYPOINT ["/tmp/script_db.sh"]