<?php
/*
    PHP-Frameworks-Bench
    this is a simple hello world controller to make benchmark
 */
namespace controllers;

class HelloWorldController extends \Ubiquity\controllers\Controller {
	public function index() {
		echo "Hello World!";
	}
}
