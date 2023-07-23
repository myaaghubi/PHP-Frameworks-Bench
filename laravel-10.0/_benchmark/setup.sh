#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project --prefer-dist laravel/laravel:^10.0 ./_benchmark/temp
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -rf _benchmark/laravel/. ./

# some enhancements
composer install --optimize-autoloader --no-dev
chmod o+w storage/*
chmod o+w storage/framework/*
php artisan optimize
rm ./public/.htaccess