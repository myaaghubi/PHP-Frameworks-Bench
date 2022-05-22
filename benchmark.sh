#!/bin/sh

if [ ! `which wrk` ]; then
    echo "wrk not found."
    exit 1;
fi

if [ ! `which curl` ]; then
    echo "curl not found."
    exit 1;
fi

base="http://127.0.0.1/php-frameworks-bench"

if [ $# -eq 0 ]; then
    # include frameworks list
    . ./list.sh
    export targets="$list"
else
    export targets="${@%/}"
fi

cd base

sh hello_world.sh "$base"

php ../bin/show_results_table.php