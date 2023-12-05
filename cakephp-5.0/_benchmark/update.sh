#!/bin/sh
composer update

# have the route & controller
yes|cp -r _benchmark/cakephp/* ./

# some enhancements
composer dump-autoload -o
composer install --no-interaction --no-dev -o
rm ./webroot/.htaccess