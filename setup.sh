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

for fw in $param_targets
do
    if [ -d "$fw" ]; then
        echo "\n\n"
        echo "/------- $fw: setting up -------/"
        cd "$fw"
        . "_benchmark/setup.sh"
        cd ..
    fi
done

find . -name ".htaccess" -exec rm -rf {} \;
