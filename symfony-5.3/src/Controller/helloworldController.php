<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;

class helloworldController
{
    public function index(): Response
    {
        return new Response('Hello World!');
    }
}
