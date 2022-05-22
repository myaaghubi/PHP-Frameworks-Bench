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

for fw in $targets
do
    if [ -d "$fw" ]; then
        echo "/------- $fw: updating -------/"
        cd "$fw"
        . "_benchmark/update.sh"
        cd ..
    fi
done
