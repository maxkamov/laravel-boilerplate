FROM php:8.2-cli-alpine

RUN apk add --no-cache libpq-dev wget unzip \
    && docker-php-ext-install pdo_mysql pcntl

RUN wget https://getcomposer.org/installer -O - -q | php -- --version=2.8.9 --install-dir=/bin --filename=composer --quiet

ENV COMPOSER_ALLOW_SUPERUSER 1

COPY php.ini /usr/local/etc/php/conf.d/

WORKDIR /var/www/html
