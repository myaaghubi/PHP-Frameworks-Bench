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

. ./config

function showHelp()
{
   cat << HEREDOC

    Usage: bash benchmark.sh [-f] [-rapache] [-t pure-php slim]

    Optional Arguments:
        -f, --fresh                 Clean all frameworks and install the target framework -fresh install- before benchmark.
        -h, --help                  Show this help message and exit
        -rapache, --restart-apache  Restart apache "sudo systemctl restart apache2" before each benchmark.
        -rnginx, --restart-nginx    Restart apache "sudo systemctl restart nginx" before each benchmark.
        -t, --target                Specify your target framework/s for benchmarking
                                    Separate them via space.

HEREDOC
} 

export param_targets="$frameworks_list"
export param_fresh=false
export param_restart_apache=false
export param_restart_nginx=false

oldIFS="$IFS"
paramsin="${@%/}"
IFS='()'
# ${paramsin%%*( )} not a good idea
paramsin=(`php ./libs/trim.php "r" "${paramsin}"`)
IFS=';'
params=(`php ./libs/strreplace.php " -" ";-" " ${paramsin}"`)
IFS=$oldIFS

init_benchmark=true
for option in "${params[@]}"
do
	case "$option" in
        -f|--fresh)
            param_fresh=true
            ;;
        -rapache|--restart-apache)
            param_restart_apache=true
            ;;
        -rnginx|--restart-nginx)
            param_restart_nginx=true
            ;;
        -t*|--target*)
            arg_=${option//--target /}
            arg_=${arg_//-t /}
            if [ ${#arg_} -ge 5 ]; then
                param_targets="$arg_"
            fi
            ;;
        -h|--help)
            init_benchmark=false
            showHelp;
            ;;
        ""|" ")
            ;;
        *)
            init_benchmark=false
            echo "\"${option}\" not available"
            exit 1
            ;;
    esac
done

if [ "$init_benchmark" = true ]; then
    sh ./base/hello_world.sh 
    echo ''
    bash results.sh
fi