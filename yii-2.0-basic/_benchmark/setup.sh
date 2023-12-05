#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project --prefer-dist yiisoft/yii2-app-basic:2.0.* ./_benchmark/temp --ansi
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -r _benchmark/yii2/* ./

# some enhancements
# composer install --no-dev -o
# I used --ignore-platform-req=php because at the moment
# yii 2 basic not support php 8.2 
composer --ignore-platform-req=php install --no-dev -o --ansi