#!/bin/sh
composer update

# have the route & controller
yes|cp -r _benchmark/codeigniter/* ./

# some enhancements
composer install --no-dev -o
chmod -R o+w writable
rm ./public/.htaccess