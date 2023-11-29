#!/bin/sh
composer update

# have the route & controller
yes|cp -rf _benchmark/laminas/. ./

# some enhancements
composer install --optimize-autoloader --no-dev
chmod -R o+w data/cache
rm ./public/.htaccess