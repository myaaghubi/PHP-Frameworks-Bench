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
        return $this->response->withStringBody('Hello World!');
    }
}
