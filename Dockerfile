FROM php:7.2.2-fpm
LABEL maintainer="lizheming<i@imnerd.org>"

RUN apt-get update
RUN /usr/local/bin/docker-php-ext-install opcache pdo_mysql
RUN pecl install yaf
RUN pecl install redis
RUN /usr/local/bin/docker-php-ext-enable opcache yaf redis
COPY php.ini /usr/local/etc/php
