#!/bin/sh

if [ ! `which php` ]; then
    echo "php not found."
    exit 1;
fi

function showHelp()
{
   cat << HEREDOC

    Usage: bash results.sh [-t 0] [-c 3]

    Optional Arguments:
        -c [index], --compare [index]   Compare current results with (use --list)
        -d [index], --delete [index]    Delete by index id (use --list)
        -dall, --deleteall              Delete all results
        -h, --help                      Show this help message and exit
        -l, --list                      Show all results in order
        -t [index], --top [index]       Specify a result by index (use --list)

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
index=0
compare_to=1
for option in "${params[@]}"
do
	case "$option" in
        -dall|--deleteall)
            rm -rf ./output/*
            ;;
        -c*|--compare*)
            compare=${option//--compare /}
            compare=${option//-c /}
            if [ ${#compare} -ge 0 ]; then
                compare_to="$compare"
            fi
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
        -t*|--top*)
            top=${option//--top /}
            top=${option//-t /}
            if [ ${#top} -ge 0 ]; then
                index="$top"
                compare_to=$index+1
            fi
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

php ./libs/show_results_table.php $index $compare_to