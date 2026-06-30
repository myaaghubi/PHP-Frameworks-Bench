<?php 
/*
    PHP-Frameworks-Bench
    this is a simple hello world controller to make benchmark
 */
namespace App\Http\Controllers;

class HelloWorldController extends Controller {
    public function index(): void {
        echo 'Hello World!';
    }
}

?>