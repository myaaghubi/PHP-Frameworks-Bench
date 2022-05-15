#!/bin/sh
composer update

# have the route & controller
yes|cp -rf _benchmark/lumen/. ./

# some enhancements
composer install --no-dev -o
chmod o+w storage/*
chmod o+w storage/framework/*
rm ./public/.htaccess