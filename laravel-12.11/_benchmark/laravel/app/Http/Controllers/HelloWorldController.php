<?php 
/*
    PHP-Frameworks-Bench
    this is a simple hello world controller to make benchmark
 */
namespace App\Http\Controllers;

class HelloWorldController extends Controller {
    public function index(): void {
        echo 'Hello World!';
        require $_SERVER['DOCUMENT_ROOT'].'/PHP-Frameworks-Bench/libs/output_data.php';
    }
}

?>