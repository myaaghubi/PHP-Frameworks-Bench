<?php
require __DIR__ . '/vendor/autoload.php';


$app = new \Slim\App();

$container = $app->getContainer();

/* *** php-frameworks-bench *** */
$app->get('/hello/index', Controllers\HelloWorldController::class . ':index');

$app->run();

/* *** php-frameworks-bench *** */
require $_SERVER['DOCUMENT_ROOT'].'/php-frameworks-bench/libs/output_data.php';