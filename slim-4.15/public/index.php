<?php
use Slim\Factory\AppFactory;

require __DIR__.'/../vendor/autoload.php';

// Instantiate App
$app = AppFactory::create();

// xampp
$app->setBasePath("/PHP-Frameworks-Bench/slim-4.14/public/index.php");

// Add error middleware
$app->addErrorMiddleware(false, true, true);

/* *** PHP-Frameworks-Bench *** */
$app->get('/hello/index', Controllers\HelloWorldController::class . ':index');

$app->run();


/* *** PHP-Frameworks-Bench *** */
require $_SERVER['DOCUMENT_ROOT'].'/PHP-Frameworks-Bench/libs/output_data.php';
