#!/bin/sh
composer update

# have the route & controller
yes|cp -r _benchmark/symfony/* ./

# some enhancements
composer dump-env prod
composer install --no-dev --optimize-autoloader
APP_ENV=prod APP_DEBUG=0 bin/console cache:clear
chmod -R o+w var
rm ./public/.htaccess