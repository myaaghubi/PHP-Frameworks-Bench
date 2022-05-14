<?php
/*
    php-frameworks-bench
    this is a simple hello world controller to make benchmark
 */
namespace Controllers;

use React\Http\Message\Response;

class HelloWorldController {
    public function __invoke(): Response {
        return Response::plaintext("Hello World!");
    }
}