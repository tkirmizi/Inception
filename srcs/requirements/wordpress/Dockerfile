FROM alpine:3.16

RUN apk update && apk add --no-cache \
    php8 \
    php8-fpm \
    php8-mysqli \
    php8-gd \
    php8-mbstring \
    php8-xml \
    php8-curl \
    curl \
    mariadb-client

# PHP-FPM yapılandırması
RUN mkdir -p /run/php && \
    sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php8/php-fpm.d/www.conf

# WordPress kurulumu için gerekli dizini oluştur
RUN mkdir -p /var/www/html

WORKDIR /var/www/html

COPY ./tools/setup_wp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup_wp.sh

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/setup_wp.sh"]
CMD ["php-fpm8", "-F"]