#!/bin/sh

if [ $# -eq 0 ]; then
    # include framework list
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