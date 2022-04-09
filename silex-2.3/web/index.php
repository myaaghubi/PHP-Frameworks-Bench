<?php

require_once __DIR__.'/../vendor/autoload.php';

$app = new Silex\Application();
// $app['debug'] = true;

/* *** php-frameworks-bench *** */
$app->get('/hello/index', 'Controllers\HelloWorldController::getIndex');

$app->run();

/* *** php-frameworks-bench *** */
require $_SERVER['DOCUMENT_ROOT'].'/php-frameworks-bench/libs/output_data.php';
