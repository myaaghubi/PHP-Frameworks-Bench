<?php
/*
    php-frameworks-bench
    this is a simple hello world controller to make benchmark
 */
namespace Application\Controller;

use Laminas\Mvc\Controller\AbstractActionController;

class HelloWorldController extends AbstractActionController {
    public function indexAction() {
        return $this->response->setContent('Hello World!');
    }
}
