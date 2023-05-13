<?php declare(strict_types=1);
/*
    PHP-Frameworks-Bench
    this is a simple hello world controller to make benchmark
 */
namespace app\controllers;

use yii\web\Controller;

// such simple controller
class HelloworldController extends Controller {
    public function actionIndex() {
        return 'Hello World!';
    }
}