#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project fuel/fuel:1.9.0 --prefer-dist ./_benchmark/temp
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -r _benchmark/fuel/* ./

# some enhancements
composer config allow-plugins.composer/installers true
composer install --no-dev -o
rm ./public/.htaccess