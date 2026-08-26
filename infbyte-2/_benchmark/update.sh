#!/bin/sh
composer update

# retain the benchmark route and controller
yes|cp -rf _benchmark/infbyte/. ./

# rebuild the production autoloader and framework caches
composer install --no-dev --optimize-autoloader --classmap-authoritative --ansi
php infbyte optimize
chmod -R o+w bootstrap/cache storage

rm -f ./public/.htaccess
