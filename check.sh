#!/bin/sh

if [ ! `which php` ]; then
    echo "php not found."
    exit 1;
fi

. ./benchmark.config

function showHelp()
{
   cat << HEREDOC

    Usage: bash check.sh [-t pure-php/ slim]

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

for fw in `echo $param_targets`
do
    if [ -d "$fw" ]; then
        echo -n "/------- $fw: checking... "
        . "$fw/_benchmark/hello_world.sh"

        url_output=$(curl -s "$url")

        # expected to get the Hello World! + libs/output_data.php
        if ! [[ "$url_output" =~ ^('Hello World!')(.*)(([0-9]*):(([0-9]+([.][0-9]*)?|[.][0-9]+)):([0-9]*))$ ]]; then
            echo -e "error: \n$url"
            echo "$url_output"
        else
            echo "done."
        fi
    fi
done