#!/bin/sh

if [ ! `which composer` ]; then
    echo "composer not found."
    exit 1;
fi

if [ $# -eq 0 ]; then
    # include frameworks list
    . ./list.sh
    targets="$list"
else
    targets="${@%/}"
fi

shopt -s extglob

for fw in $targets
do
    if [ -d "$fw" ]; then
        echo -n "/------- $fw: clearing cache "
        cd "$fw"
        . "_benchmark/clear-cache.sh"
        cd ..
    fi
done