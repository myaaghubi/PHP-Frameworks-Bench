FROM php:8.2-apache

RUN apt-get update \
    && apt-get install -y libicu-dev

RUN mkdir /var/www/html/PHP-Frameworks-Bench

# Need it in a lot of frameworks
RUN docker-php-ext-install intl

# Optional opcache (recommended)
#RUN docker-php-ext-install opcache
