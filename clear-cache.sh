#!/bin/sh

if [ ! `which composer` ]; then
    echo "composer not found."
    exit 1;
fi

if [ ! `which php` ]; then
    echo "php not found."
    exit 1;
fi

. ./benchmark.config

function showHelp()
{
   cat << HEREDOC

    Usage: bash clear-cache.sh [-t pure-php/ slim]

    Optional Arguments:
        -h, --help                 Show this help message and exit
        -t, --targets              Specify your target frameworks for benchmarking.

HEREDOC
} 

. ./list.sh
export param_targets="$list"

insputs=" ${@%/}"
IFS=';'
params=(`php ./libs/strreplace.php " -" ";-" " ${insputs}"`)

for option in "${params[@]}"
do
	case "$option" in
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

shopt -s extglob

for fw in $param_targets
do
    if [ -d "$fw" ]; then
        echo -n "> clearing cache: $fw "
        cd "$fw"
        . "_benchmark/clear-cache.sh"
        cd ..
    fi
done