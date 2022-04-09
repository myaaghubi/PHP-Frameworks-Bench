<?php declare(strict_types=1);

/*
    php-frameworks-bench
    this is a simple hello world controller to make benchmark
 */

namespace Controllers;

use Slim\Http\ServerRequest;
use Slim\Http\Response;

// such simple controller
class HelloWorldController {
    public function index(ServerRequest $request, Response $response, $args): Response {
        $response->getBody()->write("Hello World!");
        return $response;
    }
}
