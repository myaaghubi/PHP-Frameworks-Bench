#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project --prefer-dist cakephp/app:4.3 ./_benchmark/temp
yes|mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -r _benchmark/cakephp/* ./

# some enhancement
composer dump-autoload -o
sudo rm -rf tmp/*
composer install --no-interaction --no-dev -o