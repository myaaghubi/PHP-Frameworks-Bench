#!/bin/sh
# clear cache
php artisan cache:clear
php artisan optimize
echo -e "done"