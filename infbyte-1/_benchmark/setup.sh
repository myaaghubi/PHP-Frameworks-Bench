#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project --prefer-dist --no-dev infocyph/infbyte:1.* ./_benchmark/temp --ansi
mv ./_benchmark/temp/{.,}* ./

# add the benchmark route and controller
yes|cp -rf _benchmark/infbyte/. ./

# production configuration and optimization
sed -i 's/^APP_ENV=.*/APP_ENV=production/; s/^APP_DEBUG=.*/APP_DEBUG=false/' .env
composer install --no-dev --optimize-autoloader --classmap-authoritative --ansi
php infbyte optimize
chmod -R o+w bootstrap/cache storage

rm ./public/.htaccess
