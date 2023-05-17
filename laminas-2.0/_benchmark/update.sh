#!/bin/sh
composer update

# have the route & controller
yes|cp -rf _benchmark/laminas/. ./

# some enhancements
composer install --optimize-autoloader --no-dev
rm ./public/.htaccess