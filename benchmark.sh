#!/bin/sh

if [ ! `which php` ]; then
    echo "php not found."
    exit 1;
fi

if [ ! `which wrk` ]; then
    echo "WRK not found."
    exit 1;
fi

if [ ! `which curl` ]; then
    echo "CURL not found."
    exit 1;
fi

function showHelp()
{
   cat << HEREDOC

    Usage: bash benchmark.sh [-c] [-rapache] [-t pure-php laravel-10]

    Optional Arguments:
        -c, --clean NUM            Clean all frameworks and install the target framework -fresh install- before benchmark.
        -h, --help                 Show this help message and exit
        -rapache, --restart-apache Restart apache "sudo systemctl restart apache2" before each benchmark.
        -rnginx, --restart-nginx   Restart apache "sudo systemctl restart nginx" before each benchmark.
        -t, --targets              Specify your target frameworks for benchmarking.

HEREDOC
} 

. ./list.sh
export param_targets="$list"
export param_clean=false
export param_restart_apache=false
export param_restart_nginx=false

insputs=" ${@%/}"
IFS=';'
params=(`php ./libs/strreplace.php " -" ";-" " ${insputs}"`)

for option in "${params[@]}"
do
	case "$option" in
        -c|--clean)
            param_clean=true
            ;;
        -rapache|--restart-apache)
            param_restart_apache=true
            ;;
        -rnginx|--restart-nginx)
            param_restart_nginx=true
            ;;
        -t*|--targets*)
            arg_=${option//--targets /}
            arg_=${arg_//-t /}
            param_targets="$arg_"
            ;;
        -h|--help)
            showHelp;
            ;;
        " ")
            ;;
        *)
            echo "${option} not available"
            ;;
    esac
done

sh ./base/hello_world.sh 

php ./libs/show_results_table.php