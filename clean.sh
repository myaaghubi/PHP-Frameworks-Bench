#!/bin/sh

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
        echo "/------- $fw: cleaning"
        cd "$fw"
        . "_benchmark/clean.sh"
        cd ..
    fi
done