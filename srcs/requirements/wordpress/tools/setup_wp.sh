#!/bin/sh

if [ ! -f /var/www/html/wp-config.php ]; then
	cd /var/www/html

	wget https://wordpress.org/latest.tar.gz
	tar -xzf latest.tar.gz
	mv wordpress/* .
	rm -rf wordpress latest.tar.gz

	cp wp-config-sample.php wp-config.php

	sed -i "s/database_name_here/${MYSQL_DATABASE}/g" wp-config.php
	sed -i "s/username_here/${MYSQL_USER}/g" wp-config.php
	sed -i "s/password_here/${MYSQL_PASSWORD}/g" wp-config.php
	sed -i "s/localhost/mariadb/g" wp-config.php

	chown -R nobody:nobody /var/www/html
fi

exec php-fpm8 -F