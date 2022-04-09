#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project --prefer-dist laravel/lumen:9.0.0 ./_benchmark/temp
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -rf _benchmark/lumen/. ./

# some enhancement
composer install --no-dev -o
chmod o+w storage/*
chmod o+w storage/framework/*