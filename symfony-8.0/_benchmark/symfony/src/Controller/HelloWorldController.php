<?php declare(strict_types=1);
/*
    PHP-Frameworks-Bench
    this is a simple hello world controller to make benchmark
 */
namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;

// such simple controller
class HelloWorldController {
    public function index(): Response {
        return new Response('Hello World!');
    }
}