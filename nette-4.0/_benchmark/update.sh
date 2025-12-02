#!/bin/sh
composer update

# override the route & controller
yes|cp -r _benchmark/nette/* ./

# some enhancements
composer install --no-dev --optimize-autoloader
chmod -R o+w var