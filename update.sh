#!/bin/sh
if [ ! `which composer` ]; then
    echo "composer not found."
    exit 1;
fi

. ./config
. ./base/option_target.sh

for fw in $param_targets
do
    if [ -d "$fw" ]; then
        echo "/------- $fw: updating -------/"
        cd "$fw"
        . "_benchmark/update.sh"
        cd ..
    fi
done
