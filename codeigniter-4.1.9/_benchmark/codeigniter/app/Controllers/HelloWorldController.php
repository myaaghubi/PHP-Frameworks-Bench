<?php
/*
    php-frameworks-bench
    this is a simple hello world controller to make benchmark
 */
namespace App\Controllers;

class HelloWorldController extends BaseController {
    public function index() {
        echo 'Hello World!';
    }
}
