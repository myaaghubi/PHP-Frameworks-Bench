<?php

// This is enough I think, but you can programm a more complex one or a more simpler one

$prefix = '/php-frameworks-bench/no-framework';

$uri = $_SERVER['REQUEST_URI'];

switch ($uri) {
    case $prefix.'/index.php/hello/index':
        require 'controllers/helloworldController.php';
        (new Controllers\helloworldController)->getIndex();
        break;
    default:
        http_response_code(404);
        print 'Error 404';
        break;
}

require $_SERVER['DOCUMENT_ROOT'].'/php-frameworks-bench/libs/output_data.php';
