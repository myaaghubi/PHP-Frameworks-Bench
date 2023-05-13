<?php
/*
    PHP-Frameworks-Bench
    this is a simple hello world controller to make benchmark
 */
namespace Controllers;

// such simple controller
class HelloWorldController {
    public function getIndex(): string {
        return 'Hello World!';
    }
}