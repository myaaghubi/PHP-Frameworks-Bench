#!/bin/sh
composer update

# have the route & controller
yes|cp -r _benchmark/yii2/* ./

# some enhancement
composer install --no-dev -o