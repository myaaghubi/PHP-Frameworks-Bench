<?php
/*
    php-frameworks-bench
    this is a simple hello world controller to make benchmark
 */
use App\Kernel;

use Symfony\Component\HttpFoundation\Request;

require __DIR__.'/../vendor/autoload.php';


$kernel = new Kernel('prod', false);
$request = Request::createFromGlobals();
$response = $kernel->handle($request);
$response->send();
$kernel->terminate($request, $response);

require $_SERVER['DOCUMENT_ROOT'].'/php-frameworks-bench/libs/output_data.php';