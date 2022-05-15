<?php

require __DIR__ . '/../vendor/autoload.php';

$app = new FrameworkX\App();

// routing in framework-x is based on fatroute
// so you need to have your prefix first
// https://github.com/nikic/FastRoute/issues/110#issuecomment-273760186
// Strip prefix
$prefix = '/php-frameworks-bench/frameworkx-dev';
// I believe you should fix the prefix issue, Christian, if you care

// a little bit better performance via "controller instances"
// instead "controller names", it's not much to consider
$app->get($prefix.'/public/index.php/hello/index', new Controllers\HelloWorldController());

$app->run();


/* *** php-frameworks-bench *** */
require $_SERVER['DOCUMENT_ROOT'].'/php-frameworks-bench/libs/output_data.php';