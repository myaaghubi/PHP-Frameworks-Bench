#!/bin/sh

cd `dirname $0`
. ./_functions.sh
. ../config

bn_name=`basename $0 .sh`

cd ..

mkdir -p output

export dir_datetime=`date +%y-%m-%dT%H-%M-%S`
mkdir output/$dir_datetime

results_file="output/$dir_datetime/results.log"
check_file="output/$dir_datetime/check.log"
error_file="output/$dir_datetime/error.log"
url_file="output/$dir_datetime/urls.log"

phpc=`curl -s "$base/libs/php_config.php"`
echo "/------- PHP Config -------/"
echo "$phpc"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

for fw in `echo $param_targets`
do
    echo "\n/------- $fw -------/"
    if [ -d "$fw" ]; then

        # read -p "Continue to $fw (y/n)?" choice
        # case "$choice" in
        #   y|Y ) echo "yes";;
        #   n|N ) echo "no";;
        #   * ) echo "invalid";;
        # esac
        # if [ "$choice" = "n" ] || [ "$choice" = "N" ]; then
        #     continue
        # fi

        if [ "$param_fresh" = true ]; then
            bash clean.sh
            bash setup.sh -t "$fw"
        fi

        # read -p "Continue to benchmark (y/n)?" choice
        # case "$choice" in
        #   y|Y ) echo "yes";;
        #   * ) echo "invalid";;
        # esac
        # if [ "$choice" = "n" ] || [ "$choice" = "N" ]; then
        #     continue
        # fi

        # reset the opcache
        opcacherest=`curl -s "$base/libs/reset_opcache.php"`
        echo "$opcacherest"

        if [ "$param_restart_apache" = true ]; then
            echo 'systemctl restart apache2'
            sudo systemctl restart apache2
        fi

        if [ "$param_restart_nginx" = true ]; then
            echo 'systemctl restart nginx'
            sudo systemctl restart nginx
        fi
        
        # a small gap between composer, reset_opcache, webserver restarted and benchmark
        sleep 2
        
        # get the hello world link
        . "$fw/_benchmark/hello_world.sh"

        echo "/------- $fw: benchmarking -------/"

        # run the benchmark
        benchmark "$fw" "$url"
    else
        # check for dir
        echo "${RED}Dir $fw/ doesn't exist!${NC}"
        FAIL=1
    fi
done

cat "$error_file"
