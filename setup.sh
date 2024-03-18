#!/bin/sh
export TERM=xterm-color

if [ ! `which composer` ]; then
    echo "composer not found."
    exit 1;
fi

if [ ! `which php` ]; then
    echo "php not found."
    exit 1;
fi

if [ ! `which wrk` ]; then
    echo "wrk not found."
    exit 1;
fi

if [ ! `which curl` ]; then
    echo "curl not found."
    exit 1;
fi


. ./config
. ./base/option_target.sh

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

for fw in $param_targets
do
    echo -e "\n\n"
    echo "/------- $fw: setting up -------/"
    if [ -d "$fw" ]; then
        cd "$fw"
        . "_benchmark/setup.sh"
        cd ..
    else
        # check for dir
        echo -e "${RED}Dir $fw/ doesn't exist!${NC}"
        FAIL=1
    fi
done

find . -name ".htaccess" -exec rm -rf {} \;
