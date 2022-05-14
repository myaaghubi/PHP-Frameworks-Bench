#!/bin/sh
composer update

# have the route & controller
yes|cp -rf _benchmark/ubiquity/. ./

# some enhancements
composer install --no-dev --optimize-autoloader
rm ./public/.htaccess