#!/bin/sh

. ./config

pathIni=`curl -s "$base/libs/php_ini.php"`
disableFunctions=`curl -s "$base/libs/php_disable_functions.php"`

echo "$pathIni"

if [[ -n "$disableFunctions" ]] && [[ "$disableFunctions" =~ (^|,)fastcgi_finish_request($|,) ]]; then
    # Value is already present, nothing needed
    : # 'pass' command

# if it's empty or it doesn't contain the value, then add it correctly
else
    if [[ -n "$disableFunctions" ]]; then
        disableFunctions="$disableFunctions,fastcgi_finish_request"
    else
        disableFunctions="fastcgi_finish_request"
    fi

    sed -i "s/^\(disable_functions\).*/\1 $(eval echo = \$disableFunctions)/" "$pathIni"

    phpVer=`php -v | head -n 1 | sed -E 's/PHP ([0-9]+\.[0-9]+).*/\1/'`
    sudo systemctl restart "php$phpVer-fpm"
fi



disableFunctions=`curl -s "$base/libs/php_disable_functions.php"`

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'

if [[ -n "$disableFunctions" ]] && [[ "$disableFunctions" =~ (^|,)fastcgi_finish_request($|,) ]]; then
    echo  -e "${GREEN}✔ The fastcgi_finish_request already has been disabled"
    exit 1
fi

echo -e "${RED}❌ Error! Try to set disable_functions=fastcgi_finish_request manually"
exit 0