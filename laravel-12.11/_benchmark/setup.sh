#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project --prefer-dist laravel/laravel:12.11.* ./_benchmark/temp --ansi
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -rf _benchmark/laravel/. ./

# some enhancements
# at the current time point there are problems with the --no-dev to run the framework
# composer install --optimize-autoloader --no-dev --ansi
composer install --optimize-autoloader --ansi
chmod -R o+w storage

rm ./public/.htaccess