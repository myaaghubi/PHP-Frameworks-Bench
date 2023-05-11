#!/bin/sh

cd `dirname $0`
. ./_functions.sh
. ../benchmark.config

bm_name=`basename $0 .sh`

results_file="output/results.$bm_name.log"
check_file="output/check.$bm_name.log"
error_file="output/error.$bm_name.log"
url_file="output/urls.log"

cd ..

if [ -f "$results_file" ]; then
echo "moving 1"
    mv "$results_file" "$results_file.old"
fi

if [ -f "$check_file" ]; then
echo "moving 2"
    mv "$check_file" "$check_file.old"
fi

if [ -f "$error_file" ]; then
echo "moving 3"
    mv "$error_file" "$error_file.old"
fi

if [ -f "$url_file" ]; then
echo "moving 4"
    mv "$url_file" "$url_file.old"
fi


phpv=`php -r 'echo phpversion();'`
echo "/------- PHP $phpv -------/"

for fw in `echo $param_targets`
do
    if [ -d "$fw" ]; then
        echo "/------- $fw -------/"

        # read -p "Continue to $fw (y/n)?" choice
        # case "$choice" in
        #   y|Y ) echo "yes";;
        #   n|N ) echo "no";;
        #   * ) echo "invalid";;
        # esac
        # if [ "$choice" = "n" ] || [ "$choice" = "N" ]; then
        #     continue
        # fi

        if [ "$param_clean" = true ]; then
            bash clean.sh
            bash setup.sh "$fw"
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
        php ./libs/reset_opcache.php

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
    fi
done

cat "$error_file"
