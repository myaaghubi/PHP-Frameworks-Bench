<?php
/*
    PHP-Frameworks-Bench
    this is a simple hello world controller to make benchmark
 */
namespace Controllers;

class HelloWorldController {
    public function getIndex(): void {
        echo 'Hello World!';
    }
}