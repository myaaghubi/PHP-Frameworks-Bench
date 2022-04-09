#!/bin/sh
composer update

# have the route & controller
yes|cp -r _benchmark/cakephp/* ./

# some enhancement
composer dump-autoload -o
sudo rm -rf tmp/*
composer install --no-interaction --no-dev -o