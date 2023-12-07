#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project --prefer-dist laravel/lumen:10.0.* ./_benchmark/temp --ansi
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -rf _benchmark/lumen/. ./

# some enhancements
composer install --no-dev -o --ansi
chmod -R o+w storage
rm ./public/.htaccess