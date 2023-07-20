#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project --prefer-dist kumbia/framework ./_benchmark/temp
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -r _benchmark/kumbia/* ./

# some enhancements
composer install --no-dev --optimize-autoloader

find . -name \*.htaccess -type f -delete