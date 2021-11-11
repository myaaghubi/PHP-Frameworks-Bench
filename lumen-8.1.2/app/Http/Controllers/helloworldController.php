<?php 

namespace App\Http\Controllers;

class helloworldController extends Controller {
    public function getIndex(): void {
        echo 'Hello World!';
    }
}

?>