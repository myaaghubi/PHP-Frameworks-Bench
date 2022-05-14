<?php
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);
define('DS', DIRECTORY_SEPARATOR);
define('ROOT', __DIR__ . DS . '..' . DS . 'app' . DS);
$config = include ROOT . 'config/config.php';
require ROOT . './../vendor/autoload.php';
require ROOT . 'config/services.php';
\Ubiquity\controllers\Startup::run($config);

/* *** php-frameworks-bench *** */
require $_SERVER['DOCUMENT_ROOT'].'/php-frameworks-bench/libs/output_data.php';