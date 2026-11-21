<?php

declare(strict_types=1);

use Infocyph\Webrick\Request\Request;
use Infocyph\Webrick\Response\Emitter\AutoEmitter;
use Infocyph\Webrick\Response\Response;

require dirname(__DIR__) . '/vendor/autoload.php';

/** @var \Infocyph\Foundation\Application\Application $app */
$app = require dirname(__DIR__) . '/bootstrap/app.php';

$path = $_SERVER['PATH_INFO'] ?? null;
if (!is_string($path) || $path === '') {
    $requestPath = parse_url((string) ($_SERVER['REQUEST_URI'] ?? '/'), PHP_URL_PATH);
    $scriptName = (string) ($_SERVER['SCRIPT_NAME'] ?? '');
    $path = is_string($requestPath) ? $requestPath : '/';

    if ($scriptName !== '' && str_starts_with($path, $scriptName)) {
        $path = substr($path, strlen($scriptName)) ?: '/';
    }
}

$query = (string) ($_SERVER['QUERY_STRING'] ?? '');
$_SERVER['REQUEST_URI'] = $path . ($query !== '' ? '?' . $query : '');

$request = Request::fromGlobals();
$response = $app->handle($request);

ob_start();
require dirname(__DIR__, 2) . '/libs/output_data.php';
$benchmarkData = ob_get_clean();

$response = Response::create(
    (string) $response->getBody() . (is_string($benchmarkData) ? $benchmarkData : ''),
    $response->getStatusCode(),
    $response->getHeaders(),
);

new AutoEmitter()->emit($response, $request);
