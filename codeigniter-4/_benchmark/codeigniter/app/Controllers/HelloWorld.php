<?php
/*
    PHP-Frameworks-Bench
    this is a simple hello world controller to make benchmark
 */
namespace App\Controllers;

class HelloWorld extends BaseController
{
    public function index(): string
    {
        return 'Hello World!';
    }
}
