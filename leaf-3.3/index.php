<?php

require 'vendor/autoload.php';

app()->get("/index.php/hello/index", 'Controllers\HelloWorldController@index');

app()->run();

require $_SERVER['DOCUMENT_ROOT'].'/PHP-Frameworks-Bench/libs/output_data.php';
