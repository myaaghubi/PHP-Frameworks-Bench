<?php

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

require __DIR__.'/vendor/autoload.php';

// Instantiate App
$app = AppFactory::create();

// xampp
$app->setBasePath("/php-frameworks-bench/slim-4.9/index.php");

// Add error middleware
$app->addErrorMiddleware(false, true, true);

$app->get('/hello/index', function (Request $request, Response $response, $args) {
    $response = $response->withHeader('Connection', 'close');
    $response = $response->withProtocolVersion('1.0');
    $response->getBody()->write("Hello World!");
    return $response;
});

$app->run();


require $_SERVER['DOCUMENT_ROOT'].'/php-frameworks-bench/libs/output_data.php';
