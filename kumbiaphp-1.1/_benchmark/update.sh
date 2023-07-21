#!/bin/sh
composer update --no-dev --optimize-autoloader

# have the route & controller
yes|cp -r _benchmark/kumbia/* ./

find . -name \*.htaccess -type f -delete