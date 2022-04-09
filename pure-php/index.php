<?php
/*
    php-frameworks-bench
    This is enough I think, but you can programm a more complex one or a more simpler one */
// 

$uri = $_SERVER['REQUEST_URI'];

$prefix = '/php-frameworks-bench/pure-php';

require_once ('Controllers/HelloWorldController.php');

// Strip query string (?foo=bar) and decode URI
if (false !== $pos = strpos($uri, '?')) {
    $uri = substr($uri, 0, $pos);
}
$uri = rawurldecode($uri);

if ($prefix !== '' && strpos($uri, $prefix) === 0) {
    $uri = substr($uri, strlen($prefix));
}

switch ($uri) {
    case '/index.php/hello/index':
    call_user_func ([new Controllers\HelloWorldController, 'getIndex']);
    break;
    default:
    http_response_code(404);
    print 'Error 404';
    break;
}

require $_SERVER['DOCUMENT_ROOT'].'/php-frameworks-bench/libs/output_data.php';
