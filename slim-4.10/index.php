<?php
use Slim\Factory\AppFactory;

require __DIR__.'/vendor/autoload.php';

// Instantiate App
$app = AppFactory::create();

// xampp
$app->setBasePath("/php-frameworks-bench/slim-4.10/index.php");

// Add error middleware
$app->addErrorMiddleware(false, true, true);

/* *** php-frameworks-bench *** */
$app->get('/hello/index', Controllers\HelloWorldController::class . ':index');

$app->run();


/* *** php-frameworks-bench *** */
require $_SERVER['DOCUMENT_ROOT'].'/php-frameworks-bench/libs/output_data.php';
