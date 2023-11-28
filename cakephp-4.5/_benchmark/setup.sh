#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project --prefer-dist cakephp/app:^4.5 ./_benchmark/temp
yes|mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -r _benchmark/cakephp/* ./

# some enhancements
composer dump-autoload -o
composer install --no-interaction --no-dev -o
rm ./webroot/.htaccess