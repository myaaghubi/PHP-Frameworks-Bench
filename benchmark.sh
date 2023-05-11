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

. ./benchmark.config

function showHelp()
{
   cat << HEREDOC

    Usage: bash benchmark.sh [-c] [-rapache] [-t pure-php slim]

    Optional Arguments:
        -c, --clean                 Clean all frameworks and install the target framework -fresh install- before benchmark.
        -h, --help                  Show this help message and exit
        -rapache, --restart-apache  Restart apache "sudo systemctl restart apache2" before each benchmark.
        -rnginx, --restart-nginx    Restart apache "sudo systemctl restart nginx" before each benchmark.
        -t, --target                Specify your target framework/s for benchmarking
                                    Separate them via space.

HEREDOC
} 

export param_targets="$frameworks_list"
export param_clean=false
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
        -t*|--target*)
            arg_=${option//--target /}
            arg_=${arg_//-t /}
            if [ ${#arg_} -ge 5 ]; then
                param_targets="$arg_"
            fi
            ;;
        -h|--help)
            showHelp;
            ;;
        ""|" ")
            ;;
        *)
            echo "\"${option}\" not available"
            exit 1
            ;;
    esac
done

sh ./base/hello_world.sh 

php ./libs/show_results_table.php