<?php

class HelloworldController extends AppController
{

    public function index()
    {
        // View without template and view
        View::select(null, null);

        echo 'Hello World!';
    }
}
