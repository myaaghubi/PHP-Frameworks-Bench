#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project --prefer-dist kumbia/framework:1.1.* ./_benchmark/temp --ansi
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -r _benchmark/kumbia/* ./

# some enhancements
composer install --no-dev --optimize-autoloader --ansi

find . -name \*.htaccess -type f -delete