benchmark () {
    fw="$1"
    url="$2"
    output_wrk_address="output/$dir_datetime/$fw.wrk.log"
    output="output/$dir_datetime/$fw.output"

    # check out the appropriate response is reachable
    url_status=$(bash check.sh -t "$fw")
    
    # find 'done'
    status=${url_status%%✔ ${fw}*}

    count=5
    total=0
    i=0
    # The for (( expr ; expr ; expr )) syntax is not available in sh, so:
    while [ $i -lt $count ]
    do
        curl -sS "$url" > "$output"
        t=`tail -1 "$output" | cut -f 2 -d ':'`
        total=`php ./libs/sum_ms.php $t $total`
        i=$(( $i + 1 ))
    done
    time=`php ./libs/avg_ms.php $total $count`


    # get memory and file
    memory=`tail -1 "$output" | cut -f 1 -d ':'`
    file=`tail -1 "$output" | cut -f 3 -d ':'`


    # to make a small gap between the WRK and CURL
    sleep 1

    # if the index of 'done' be equal to 
    # the length of the url_status then 
    # the appropriate output (Hello World! ...) not reachable 
    # and there is no point to run the benchmark
    if [ ${#status} -eq ${#url_status} ]; then
        echo "Error! $fw: Hello World! ... not reachable"
        echo "$url"
        echo "$fw: 0: 0: 0: 0" >> "$results_file"
        return 1
    fi

    config_wrk="wrk -t${threads} -c${connections} -d${duration}s"

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

    config_wrk="$config_wrk '$url' > '$output_wrk_address'"
    eval $config_wrk

    output_wrk=$(cat "$output_wrk_address")

    rps=$( echo "$output_wrk" | grep "Requests/sec:" | sed -n 's/.* \([.0-9]*\).*/\1/p')
    echo "rps: $rps"

    socket_errors=$(echo "$output_wrk" | grep "Socket errors" | sed -n 's/.*: \(.*\).*/\1/p')
    connect_errors=0
    read_errors=0
    write_errors=0
    timeout_errors=0
    total_socket_errors=0

    if [ -n "${socket_errors}" ]; then
        connect_errors=$(echo "$socket_errors" | sed -n 's/.*connect \([0-9]*\).*/\1/p')
        read_errors=$(echo "$socket_errors" | sed -n 's/.*read \([0-9]*\).*/\1/p')
        write_errors=$(echo "$socket_errors" | sed -n 's/.*write \([0-9]*\).*/\1/p')
        timeout_errors=$(echo "$socket_errors" | sed -n 's/.*timeout \([0-9]*\).*/\1/p')
        total_socket_errors=$(( connect_errors + read_errors + write_errors + timeout_errors ))
    else
        socket_errors=0
    fi

    non_2xx_3xx=$(echo "$output_wrk" | grep "Non-2xx or 3xx responses:" | sed -n 's/.* \([0-9]*\).*/\1/p')
    if [ -z "${non_2xx_3xx}" ]; then
        non_2xx_3xx=0
    fi


    echo "socket_errors: $socket_errors, total $total_socket_errors, non 2xx/3xx $non_2xx_3xx"

    echo "$fw: $rps: $memory: $time: $file: $duration: $connect_errors: $read_errors: $write_errors: $timeout_errors: $non_2xx_3xx" >> "$results_file"

    echo "$fw" >> "$check_file"
    grep "Document Length:" "$output_wrk_address" >> "$check_file"
    grep "Failed requests:" "$output_wrk_address" >> "$check_file"
    grep 'Hello World!' "$output" >> "$check_file"

    # check errors
    touch "$error_file"
    error=''
    x=`grep 'Failed requests:        0' "$output_wrk_address"`
    if [ "$x" = "" ]; then
        tmp=`grep "Failed requests:" "$output_wrk_address"`
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
}
