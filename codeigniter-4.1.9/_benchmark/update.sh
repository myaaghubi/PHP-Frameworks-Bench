#!/bin/sh
composer update

# have the route & controller
yes|cp -r _benchmark/codeigniter/* ./

# some enhancement
composer install --no-dev -o