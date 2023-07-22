#!/bin/sh

. ./benchmark.config
. ./base/option_target.sh

OK='\U2714'
ERROR='\U274C'

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

FAIL=0

for fw in `echo $param_targets`
do
    if [ -d "$fw" ]; then
        . "$fw/_benchmark/hello_world.sh"

        url_output=$(curl -s "$url")

        # expected to get the Hello World! + libs/output_data.php
        if ! [[ "$url_output" =~ ^('Hello World!')(.*)(([0-9]*):(([0-9]+([.][0-9]*)?|[.][0-9]+)):([0-9]*))$ ]]; then
            echo -e "${RED}${ERROR} $fw ${NC}"
            echo "$url"
            echo "$url_output"
            FAIL=1
        else
            echo -e "${GREEN}${OK} $fw ${NC}"
        fi
    fi
done

exit $FAIL