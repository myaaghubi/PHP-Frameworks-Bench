<?php

error_reporting(0);


require __DIR__ . '/vendor/autoload.php';


$app = new Slim\App();

$container = $app->getContainer();

$container['notFoundHandler'] = function ($container) {
    return function ($request, $response) use ($container) {
        $controller = new \App\Controller\ExceptionController($container);
        return $controller->notFound($request, $response);
    };
};


$app->get('/hello/index', function ($request, $response, $args) {
	$response = $response->withHeader('Connection', 'close');
    $response = $response->withProtocolVersion('1.0');
    $response->write("Hello World!");
    return $response;
});


$app->run();

require $_SERVER['DOCUMENT_ROOT'].'/php-frameworks-bench/libs/output_data.php';
