<?php

require '../vendor/autoload.php';

$f3 = \Base::instance();

$f3->route('GET /index.php/hello/index', 'Controllers\HelloWorldController->index');

$f3->run();

require $_SERVER['DOCUMENT_ROOT'].'/PHP-Frameworks-Bench/libs/output_data.php';
