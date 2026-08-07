<?php

declare(strict_types=1);

use App\Http\Controllers\HelloWorldController;
use App\Http\Controllers\SystemController;
use Infocyph\Webrick\Router\Facade\Router as Route;

Route::get('/api/health', SystemController::health(...));
Route::get('/json', SystemController::json(...), 'json');
Route::get('/hello/index', HelloWorldController::index(...));
