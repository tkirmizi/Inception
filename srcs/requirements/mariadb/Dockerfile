FROM alpine:3.16

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY ./conf/my.cnf /etc/my.cnf.d/mariadb-server.cnf

# COPY initSh to inside

RUN chmod +x /usr/local/bin/init_db.sh

RUN mkdir -p /run/mysql && \
	chown -R mysql:mysql /run/mysqld /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/init_db.sh"]
