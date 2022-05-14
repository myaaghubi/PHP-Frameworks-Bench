#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project phpmv/ubiquity-project:2.4.x-dev ./_benchmark/temp
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -rf _benchmark/ubiquity/. ./

# some enhancements
composer install --no-dev --optimize-autoloader
rm ./public/.htaccess