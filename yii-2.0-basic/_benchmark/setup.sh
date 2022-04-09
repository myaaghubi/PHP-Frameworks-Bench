#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project --prefer-dist yiisoft/yii2-app-basic:"^2.0" ./_benchmark/temp
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -r _benchmark/yii2/* ./

# some enhancement
composer install --no-dev -o

