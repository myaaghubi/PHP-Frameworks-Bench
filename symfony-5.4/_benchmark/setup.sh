#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project symfony/skeleton:5.4.99 ./_benchmark/temp
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -r _benchmark/symfony/* ./

# some enhancements
composer dump-env prod
APP_ENV=prod APP_DEBUG=0 php bin/console cache:clear
composer install --no-dev --optimize-autoloader