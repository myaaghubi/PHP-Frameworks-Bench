#!/bin/sh

base="http://127.0.0.1/php-frameworks-bench"

# cd `dirname $0`#

if [ $# -eq 0 ]; then
    # include framework list
    . ./list.sh
    export targets="$list"
else
    export targets="${@%/}"
fi

for fw in `echo $targets`
do
    if [ -d "$fw" ]; then
        echo -n "/------- $fw: checking... "
        . "$fw/_benchmark/hello_world.sh"

        url_output=$(curl -s "$url")

        # expected to get the Hello World! + libs/output_data.php
        if ! [[ "$url_output" =~ ^('Hello World!')(.*)(([0-9]*):(([0-9]+([.][0-9]*)?|[.][0-9]+)):([0-9]*))$ ]]; then
            echo -e "error: \n$url"
            echo "$url_output"
        else
            echo "done."
        fi
    fi
done