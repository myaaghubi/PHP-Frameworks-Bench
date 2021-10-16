<?php

require_once __DIR__.'/../vendor/autoload.php';

$app = new Silex\Application();
// $app['debug']=false;

// $app->get('/', function(){
//         global $app;
//         return 'Hello World!';
// });

$app->get('/hello/index', function(){
        // return 'Hello World!'.$app['debug'];
        return 'Hello World!';
});

$app->run();

require $_SERVER['DOCUMENT_ROOT'].'/php-framework-benchmark/libs/output_data.php';
