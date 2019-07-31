FROM php:7.2.2-fpm
LABEL maintainer="lizheming<i@imnerd.org>"

RUN echo "deb http://mirrors.aliyun.com/debian stretch main contrib non-free" > /etc/apt/sources.list && \
  echo "deb-src http://mirrors.aliyun.com/debian stretch main contrib non-free" >> /etc/apt/sources.list  && \
  echo "deb http://mirrors.aliyun.com/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list && \
  echo "deb-src http://mirrors.aliyun.com/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list && \
  echo "deb http://mirrors.aliyun.com/debian-security stretch/updates main contrib non-free" >> /etc/apt/sources.list && \
  echo "deb-src http://mirrors.aliyun.com/debian-security stretch/updates main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update
RUN /usr/local/bin/docker-php-ext-install opcache pdo_mysql
RUN pecl install yaf
RUN pecl install redis
RUN /usr/local/bin/docker-php-ext-enable opcache yaf redis
COPY php.ini /usr/local/etc/php
