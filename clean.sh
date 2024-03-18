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
    if [ -d "$fw" ]; then
        echo "> cleaning $fw "
        cd "$fw"
        . "_benchmark/clean.sh"
        cd ..
    else
        # check for dir
        echo -e "${RED}Dir $fw/ doesn't exist!"
        FAIL=1
    fi
done