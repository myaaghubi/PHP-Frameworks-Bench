#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project codeigniter/framework:^3.1 --no-dev ./_benchmark/temp
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -r _benchmark/codeigniter/* ./

# some enhancements
composer install --no-dev --optimize-autoloader
