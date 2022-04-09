<?php

require __DIR__.'/vendor/autoload.php';


/* *** php-frameworks-bench *** */
Siler\Route\class_name('/index.php/hello/index', Controllers\HelloWorldController::class);


/* *** php-frameworks-bench *** */
require $_SERVER['DOCUMENT_ROOT'].'/php-frameworks-bench/libs/output_data.php';
