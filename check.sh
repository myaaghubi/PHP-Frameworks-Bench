#!/bin/sh

. ./config
. ./base/option_target.sh

# Colors
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
            echo -e "${RED}❌ $fw ${NC}"
            echo "$url"

            if [ -x "$(command -v w3m)" ]; then
                echo "$url_output" | w3m -dump -T text/html
            else
                echo "$url_output"
            fi

            FAIL=1
        else
            printf "%-34b %4s bytes   %s\n" "${GREEN}✔ $fw ${NC}" "${#url_output}" "$url"
        fi
    else
        # if exist in config, but not exist the dir
        echo -e "${RED}❌ Dir $fw ${NC} doesn't exist"
        FAIL=1
    fi
done

exit $FAIL