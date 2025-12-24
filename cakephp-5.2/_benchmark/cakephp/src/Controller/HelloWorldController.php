<?php declare(strict_types=1);

/*
    PHP-Frameworks-Bench
    this is a simple hello world controller to make benchmark
 */

namespace App\Controller;

// such simple controller
class HelloWorldController extends AppController {

    public function display()
    {
        echo $this->response->withStringBody('Hello World!');
        require $_SERVER['DOCUMENT_ROOT'].'/PHP-Frameworks-Bench/libs/output_data.php';
        return "";
    }
}
