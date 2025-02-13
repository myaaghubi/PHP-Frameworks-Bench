#!/bin/sh

. ./config
. ./base/option_target.sh

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

shopt -s extglob

for fw in $param_targets
do
    echo "> cleaning $fw "
    if [ -d "$fw" ]; then
        cd "$fw"
        . "_benchmark/clean.sh"
        cd ..
    else
        # check for dir
        echo -e "${RED}Dir $fw/ doesn't exist!${NC}"
        FAIL=1
    fi
done