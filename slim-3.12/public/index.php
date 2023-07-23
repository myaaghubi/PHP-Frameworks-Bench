<?php
require __DIR__ . '/../vendor/autoload.php';


$app = new \Slim\App();

$container = $app->getContainer();

/* *** PHP-Frameworks-Bench *** */
$app->get('/hello/index', Controllers\HelloWorldController::class . ':index');

$app->run();

/* *** PHP-Frameworks-Bench *** */
require $_SERVER['DOCUMENT_ROOT'].'/PHP-Frameworks-Bench/libs/output_data.php';