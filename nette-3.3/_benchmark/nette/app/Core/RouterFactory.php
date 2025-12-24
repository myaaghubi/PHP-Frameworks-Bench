<?php

declare(strict_types=1);

namespace app\Core;

use Nette;
use Nette\Application\Routers\RouteList;

/*
    PHP-Frameworks-Bench
    this is a simple hello world controller to make benchmark
 */
final class RouterFactory
{
    use Nette\StaticClass;

    public static function createRouter(): RouteList
    {
        $router = new RouteList;
        $router
            ->withPath('index.php')
            ->addRoute('hello/index', function () {
                echo 'Hello World!';
            });

        return $router;
    }
}
