benchmark () {
    fw="$1"
    url="$2"
    output_wrk="output/$fw.wrk.log"
    output="output/$fw.output"

    url_output=$(curl -s "$url")
    reqsubstr="Hello World!"

    # to make sure the appropriate response is reachable
    # otherwise, there is no point running the benchmark
    if ! [ -z "${url_output##*$reqsubstr*}" ] ;then
        tmp=`cat "$output"`
        error="$error$tmp"
        echo "error!"
        echo -e "$fw\n$error" >> "$error_file"
        echo "---" >> "$error_file"

        echo "$fw: 0: 0: 0: 0" >> "$results_file"
        return 1
    fi

    config_wrk="wrk -t50 -c1000 -d60s"

    # is it wsl!?
    # if you're using wsl, it's necessary to put -R (--rate)
    # in this version of wrk
    # I used a large number to make sure there be no limitation of rate
    # for a high end server, you can increase first two parameters
    if grep -q Microsoft /proc/version; then
        config_wrk="$config_wrk -R1000g $url"
    else
        config_wrk="$config_wrk $url"
    fi

    echo $config_wrk

    config_wrk="$config_wrk '$url' > '$output_wrk'"
    eval $config_wrk

    rps=`grep "Requests/sec:" "$output_wrk" | tr -dc '0-9.'`

    numfmt --g "$rps rps"

    # to make a small gap between the WRK and CURL
    sleep 1

    count=5
    total=0
    i=0
    # The for (( expr ; expr ; expr )) syntax is not available in sh, so:
    while [ $i -lt $count ]
    do
        curl "$url" > "$output"
        t=`tail -1 "$output" | cut -f 2 -d ':'`
        total=`php ./benchmarks/sum_ms.php $t $total`
        i=$(( $i + 1 ))
    done
    time=`php ./benchmarks/avg_ms.php $total $count`


    # get memory and file
    memory=`tail -1 "$output" | cut -f 1 -d ':'`
    file=`tail -1 "$output" | cut -f 3 -d ':'`

    echo "$fw: $rps: $memory: $time: $file" >> "$results_file"

    echo "$fw" >> "$check_file"
    grep "Document Length:" "$output_wrk" >> "$check_file"
    grep "Failed requests:" "$output_wrk" >> "$check_file"
    grep 'Hello World!' "$output" >> "$check_file"
    echo "---" >> "$check_file"

    # check errors
    touch "$error_file"
    error=''
    x=`grep 'Failed requests:        0' "$output_wrk"`
    if [ "$x" = "" ]; then
        tmp=`grep "Failed requests:" "$output_wrk"`
        error="$error$tmp"
    fi
    x=`grep 'Hello World!' "$output"`
    if [ "$x" = "" ]; then
        tmp=`cat "$output"`
        error="$error$tmp"
    fi
    if [ "$error" != "" ]; then
        echo -e "$fw\n$error" >> "$error_file"
        echo "---" >> "$error_file"
    fi

    echo "$url" >> "$url_file"

    echo
}
