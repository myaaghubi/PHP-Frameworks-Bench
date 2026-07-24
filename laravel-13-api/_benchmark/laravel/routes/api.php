<?php

use Illuminate\Support\Facades\Route;


/* *** PHP-Frameworks-Bench *** */
Route::get('/hello/index', [App\Http\Controllers\HelloWorldController::class, 'index']);