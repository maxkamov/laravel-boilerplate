FROM php:8.2-fpm-alpine

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}
ENV XDEBUG_VERSION 3.4.1

RUN addgroup -g ${GID} --system laravel
RUN adduser -G laravel --system -D -s /bin/sh -u ${UID} laravel

RUN apk add --no-cache libpq-dev fcgi git linux-headers \
    && git clone --branch $XDEBUG_VERSION --depth 1 https://github.com/xdebug/xdebug.git /usr/src/php/ext/xdebug \
    && docker-php-ext-configure xdebug --enable-xdebug-dev \
    && docker-php-ext-install xdebug \
    && apk del git linux-headers

RUN docker-php-ext-install pdo pdo_mysql

# An IDE key has to be set, but anything works, at least for PhpStorm and VS Code...
#ENV XDEBUG_CONFIG="xdebug.idekey=''"

# Copy custom php.ini (optional, but good for XDebug settings)
COPY php.ini /usr/local/etc/php/conf.d/

RUN chown -R laravel:laravel /var/www/html

USER laravel

CMD ["php-fpm"]
