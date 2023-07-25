#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project symfony/skeleton:^6.3 ./_benchmark/temp
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -r _benchmark/symfony/* ./

# some enhancement
composer dump-env prod
APP_ENV=prod APP_DEBUG=1 php bin/console cache:clear
composer install --no-dev --optimize-autoloader