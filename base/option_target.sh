#!/bin/sh

if [ ! `which php` ]; then
    echo "php not found."
    exit 1;
fi

function showHelp()
{
   cat << HEREDOC

    Usage: bash check.sh [-t pure-php slim-*]

    Optional Arguments:
        -h, --help                  Show this help message and exit
        -t, --target                Specify your target framework/s for benchmarking
                                    Separate them via space.

HEREDOC
} 

export param_targets="$frameworks_list"

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

if [ "$init_benchmark" = false ]; then
    exit 1
fi