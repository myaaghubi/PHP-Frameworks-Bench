#!/bin/sh
if [ ! `which composer` ]; then
    echo "composer not found."
    exit 1;
fi

. ./config
. ./base/option_target.sh

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

for fw in $param_targets
do
    echo "/------- $fw: updating -------/"
    if [ -d "$fw" ]; then
        cd "$fw"
        . "_benchmark/update.sh"
        cd ..
    else
        # check for dir
        echo -e "${RED}Dir $fw/ doesn't exist!${NC}"
        FAIL=1
    fi
done
