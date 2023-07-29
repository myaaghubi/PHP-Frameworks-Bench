#!/bin/sh

if [ ! `which docker` ]; then
    echo "docker not found."
    exit 1;
fi

PORT=${1:-8080}

docker build --tag bench/apache -f .docker/apache.dockerfile .

echo "Runing apache in http://127.0.0.1:$PORT"
echo -e "Press Ctrl+C to stop. \n\n"

docker run -it -p "$PORT":80 -v "$PWD":/var/www/html/PHP-Frameworks-Bench:rw bench/apache:latest
