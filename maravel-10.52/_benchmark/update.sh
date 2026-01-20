#!/bin/sh
composer update

# have the route & controller
yes|cp -rf _benchmark/maravel/. ./

# some enhancements
composer install --no-dev -o
chmod -R o+w storage
rm ./public/.htaccess