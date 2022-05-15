#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project codeigniter4/appstarter:4.1 --no-dev ./_benchmark/temp
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -r _benchmark/codeigniter/* ./

# some enhancements
composer install --no-dev -o
sudo chown -Rv www-data writable
rm ./public/.htaccess