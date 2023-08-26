#!/bin/sh

cd `dirname $0`
cd ..

. ../config

# include framework list
targets="$frameworks_list"

echo '['

for fw in $targets
do
    if [ -d "$fw" ]; then
        echo "\t'$fw',"
    fi
done

echo ']'
