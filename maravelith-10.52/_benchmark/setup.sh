#!/bin/sh
# create project
rm -rf _benchmark/temp
composer create-project --prefer-dist macropay-solutions/maravelith:10.52.* ./_benchmark/temp --ansi
mv ./_benchmark/temp/{.,}* ./

# have the route & controller
yes|cp -rf _benchmark/maravelith/. ./

# some enhancements
composer install --no-dev -o --ansi

cat >> .env << EOF
APP_ENV=production
APP_DEBUG=false
EOF

chmod -R o+w storage
rm ./public/.htaccess
