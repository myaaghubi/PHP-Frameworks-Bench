#!/bin/sh
composer update

# have the route & controller
yes|cp -r _benchmark/codeigniter/* ./

# some enhancements
composer install --no-dev -o
sudo chown -Rv www-data writable
rm ./public/.htaccess