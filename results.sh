#!/bin/sh

if [ ! `which php` ]; then
    echo "php not found."
    exit 1;
fi

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
        -l|--list)
            echo "List of results: "
            for i in "${!results[@]}"; do
                echo "$i) ${results[$i]}"
            done
            exit 1
            ;;
        ""|" ")
            ;;
        *)
            echo "\"${option}\" not available"
            exit 1
            ;;
    esac
done

php ./libs/show_results_table.php