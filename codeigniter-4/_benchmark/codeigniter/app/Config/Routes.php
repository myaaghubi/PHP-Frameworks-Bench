<?php

use CodeIgniter\Router\RouteCollection;

/** @var RouteCollection $routes */
$routes->get('/', 'Home::index');

/* *** PHP-Frameworks-Bench *** */
$routes->get('hello/index', 'HelloWorld::index');
