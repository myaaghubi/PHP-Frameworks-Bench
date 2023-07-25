#!/bin/sh
composer update

# have the route & controller
yes|cp -r _benchmark/symfony/* ./

# some enhancements
composer dump-env prod
composer install --no-dev --optimize-autoloader
APP_ENV=prod APP_DEBUG=1 php bin/console cache:clear