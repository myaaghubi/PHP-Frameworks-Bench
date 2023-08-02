<?php
/*
    PHP-Frameworks-Bench
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

require $_SERVER['DOCUMENT_ROOT'].'/PHP-Frameworks-Bench/libs/output_data.php';