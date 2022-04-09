#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project symfony/skeleton:"^6.0" ./_benchmark/temp
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -r _benchmark/symfony/* ./

# some enhancement
composer dump-env prod
composer install --no-dev --optimize-autoloader
APP_ENV=prod APP_DEBUG=0 php bin/console cache:clear