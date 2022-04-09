#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project codeigniter4/appstarter:4.1.9 --no-dev ./_benchmark/temp
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -r _benchmark/codeigniter/* ./

# some enhancement
composer install --no-dev -o