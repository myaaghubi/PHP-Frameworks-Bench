#!/bin/sh
composer update

# have the route & controller
yes|cp -rf _benchmark/laravel/. ./

# some enhancements
composer install --optimize-autoloader --no-dev
chmod o+w storage/*
sudo chmod o+w storage/framework/*
php artisan optimize
rm ./public/.htaccess