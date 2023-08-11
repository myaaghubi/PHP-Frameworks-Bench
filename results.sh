#!/bin/sh

if [ ! `which php` ]; then
    echo "php not found."
    exit 1;
fi

function showHelp()
{
   cat << HEREDOC

    Usage: bash results.sh [-l] [-t 1] [-d 2]

    Optional Arguments:
        -l, --list                      Show all results in order

        -d [index], --delete [index]    Delete by index id (use --list)
        -dall, --deleteall              Delete all results
        -h, --help                      Show this help message and exit

HEREDOC
} 

oldIFS="$IFS"
paramsin="${@%/}"
IFS='()'

paramsin=(`php ./libs/trim.php "r" "${paramsin}"`)
IFS=';'
params=(`php ./libs/strreplace.php " -" ";-" " ${paramsin}"`)
IFS=$oldIFS


results=(`ls ./output/`)

for option in "${params[@]}"
do
	case "$option" in
        -dall|--deleteall)
            rm -rf ./output/*
            ;;
        -d*|--delete*)
            delete=${option//--delete /}
            delete=${option//-d /}
            if [ ${#delete} -ge 0 ]; then
                for i in "${!results[@]}"; do
                    if [ $delete -eq $i ]; then
                        echo "Delete ./output/${results[$i]}"
                        rm -rf "./output/${results[$i]}"
                        exit 1
                    fi
                done
                echo "Index $delete not found!"
            fi
            exit 1
            ;;
        -l|--list)
            echo "List of results: "
            for i in "${!results[@]}"; do
                echo "$i) ${results[$i]}"
            done
            exit 1
            ;;
        -h|--help)
            showHelp;
            exit 1
            ;;
        ""|" ")
            ;;
        *)
            echo "\"${option}\" not available"
            ;;
    esac
done

php ./libs/show_results_table.php