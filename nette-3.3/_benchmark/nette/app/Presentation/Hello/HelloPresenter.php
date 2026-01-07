<?php

declare(strict_types=1);

namespace App\Presentation\Hello;

use Nette;

/*
    PHP-Frameworks-Bench
    this is a simple hello world controller to make benchmark
 */
final class HelloPresenter extends Nette\Application\UI\Presenter
{
    public function actionDefault(): void
    {
        echo 'Hello World!';
    }
}
