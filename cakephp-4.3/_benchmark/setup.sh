#!/bin/sh
composer dump-autoload -o
sudo rm -rf tmp/*
composer install --no-interaction --no-dev --optimize-autoloader