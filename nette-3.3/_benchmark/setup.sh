#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project nette/web-project:3.3.* ./_benchmark/temp --ansi
mv ./_benchmark/temp/* ./

# override the route & controller
yes|cp -r _benchmark/nette/* ./

# some enhancement
composer install --no-dev --optimize-autoloader --ansi
chmod -R o+w log temp
