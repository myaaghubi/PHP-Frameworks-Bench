<?php declare(strict_types=1);

/*
    php-frameworks-bench
    this is a simple hello world controller to make benchmark
 */

namespace App\Controller;

use Cake\Http\Response;

// such simple controller
class HelloWorldController extends AppController {
    public $autoRender = false;
    public function display(string ...$path): ?Response {
        return $this->response->withStringBody('Hello World!');
    }
}
