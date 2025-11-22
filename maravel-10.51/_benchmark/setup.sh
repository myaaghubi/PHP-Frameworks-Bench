#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project --prefer-dist macropay-solutions/maravel:10.51.* ./_benchmark/temp --ansi
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -rf _benchmark/maravel/. ./

# some enhancements
composer install --no-dev -o --ansi
chmod -R o+w storage
rm ./public/.htaccess