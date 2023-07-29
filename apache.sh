#!/bin/sh

if [ ! `which docker` ]; then
    echo "docker not found."
    exit 1;
fi

docker build --tag bench/apache -f .docker/apache.dockerfile .

echo "Runing apache in http://127.0.0.1:8080"

docker run -it -p 8080:80 -v "$PWD":/var/www/html/PHP-Frameworks-Bench:rw bench/apache:latest
