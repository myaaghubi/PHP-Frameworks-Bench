#!/bin/sh

if [ ! `which composer` ]; then
    echo "composer not found."
    exit 1;
fi


. ./benchmark.config
. ./base/option_target.sh

shopt -s extglob

for fw in $param_targets
do
    if [ -d "$fw" ]; then
        echo -n "> clearing cache: $fw "
        cd "$fw"
        . "_benchmark/clear-cache.sh"
        cd ..
    fi
done