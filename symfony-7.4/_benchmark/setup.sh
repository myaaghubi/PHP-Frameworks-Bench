#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project symfony/skeleton:7.4.* ./_benchmark/temp --ansi
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -r _benchmark/symfony/* ./

# some enhancement
composer dump-env prod --ansi
APP_ENV=prod APP_DEBUG=0 bin/console cache:clear
composer install --no-dev --optimize-autoloader --ansi
chmod -R o+w var