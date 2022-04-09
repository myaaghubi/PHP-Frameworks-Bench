#!/bin/sh
composer update

# have the route & controller
yes|cp -rf _benchmark/laravel/. ./

# some enhancement
composer install --optimize-autoloader --no-dev
chmod o+w storage/*
sudo chmod o+w storage/framework/*
php artisan optimize
php artisan config:clear
php artisan route:clear
# php artisan config:cache
# php artisan route:cache