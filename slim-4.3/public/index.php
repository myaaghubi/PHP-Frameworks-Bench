<?php

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

require __DIR__ . '/../vendor/autoload.php';

$app = AppFactory::create();

$app->addErrorMiddleware(false, true, true);
// xampp
$app->setBasePath("/php-framework-benchmark/slim-4.3/public/index.php");
// wsl
// $app->setBasePath("slim-4.3/index.php");

$app->get('/hello/index', function (Request $request, Response $response, $args) {
    $response = $response->withHeader('Connection', 'close');
    $response = $response->withProtocolVersion('1.0');
    $response->getBody()->write("Hello world!");
    return $response;
});

$app->run();

require $_SERVER['DOCUMENT_ROOT'].'/php-framework-benchmark/libs/output_data.php';
