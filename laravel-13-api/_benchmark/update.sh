#!/bin/sh
composer update

# have the route & controller
yes|cp -rf _benchmark/laravel/. ./

# some enhancements
# composer install --optimize-autoloader --no-dev
composer install --optimize-autoloader
chmod -R o+w storage

rm ./public/.htaccess