FROM php:8.2-apache

RUN apt-get update \
    && apt-get install -y libicu-dev

RUN mkdir /var/www/html/PHP-Frameworks-Bench

RUN docker-php-ext-install intl
