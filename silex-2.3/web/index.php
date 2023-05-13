<?php

require_once __DIR__.'/../vendor/autoload.php';

$app = new Silex\Application();
// $app['debug'] = true;

/* *** PHP-Frameworks-Bench *** */
$app->get('/hello/index', 'Controllers\HelloWorldController::getIndex');

$app->run();

/* *** PHP-Frameworks-Bench *** */
require $_SERVER['DOCUMENT_ROOT'].'/PHP-Frameworks-Bench/libs/output_data.php';
