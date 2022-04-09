<?php

require 'vendor/autoload.php';

$f3 = \Base::instance();
$f3->set('AUTOLOAD','Controllers/');

$f3->route('GET /index.php/hello/index', 'HelloWorldController->index');

$f3->run();

require $_SERVER['DOCUMENT_ROOT'].'/php-frameworks-bench/libs/output_data.php';
