#!/bin/sh

. ./benchmark.config
. ./base/option_target.sh

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

for fw in `echo $param_targets`
do
    if [ -d "$fw" ]; then
        echo -n "/------- $fw: checking... "
        . "$fw/_benchmark/hello_world.sh"

        url_output=$(curl -s "$url")

        # expected to get the Hello World! + libs/output_data.php
        if ! [[ "$url_output" =~ ^('Hello World!')(.*)(([0-9]*):(([0-9]+([.][0-9]*)?|[.][0-9]+)):([0-9]*))$ ]]; then
            echo -e "${RED}error: \n$url${NC}"
            echo "$url_output"
        else
            echo "${GREEN}done!${NC}"
        fi
    fi
done