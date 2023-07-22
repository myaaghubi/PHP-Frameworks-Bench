<?php

require __DIR__.'/../vendor/autoload.php';


/* *** PHP-Frameworks-Bench *** */
Siler\Route\class_name('/index.php/hello/index', Controllers\HelloWorldController::class);


/* *** PHP-Frameworks-Bench *** */
require $_SERVER['DOCUMENT_ROOT'].'/PHP-Frameworks-Bench/libs/output_data.php';
