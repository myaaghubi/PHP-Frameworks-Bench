<?php
/*
    PHP-Frameworks-Bench
    this is a simple hello world controller to make benchmark
 */
class Controller_HelloWorld extends Controller {
	public function action_index() {
		return 'Hello World!';
	}
}