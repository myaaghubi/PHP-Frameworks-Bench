<?php

require __DIR__.'/vendor/autoload.php';


Siler\Route\class_name('/index.php/hello/index', Controllers\helloworldController::class);


require $_SERVER['DOCUMENT_ROOT'].'/php-frameworks-bench/libs/output_data.php';
