FROM alpine:3.16

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY ./conf/my.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./tools/init_db.sh /usr/local/bin/init_db.sh

RUN chmod +x /usr/local/bin/init_db.sh && \
    mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/init_db.sh"]
