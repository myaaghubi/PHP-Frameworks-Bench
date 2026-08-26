<?php

declare(strict_types=1);

namespace App\Http\Controllers;

use Infocyph\Webrick\Response\Response;

final readonly class HelloWorldController
{
    public static function index(): Response
    {
        return Response::create('Hello World!', headers: ['Content-Type' => 'text/plain; charset=UTF-8']);
    }
}
