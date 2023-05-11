#!/bin/sh

. ./benchmark.config
. ./base/option_target.sh

shopt -s extglob

for fw in $param_targets
do
    if [ -d "$fw" ]; then
        echo "> cleaning $fw "
        cd "$fw"
        . "_benchmark/clean.sh"
        cd ..
    fi
done