<?php

$search = $argv[1];
$replace = $argv[2];
$string = $argv[3];

echo str_replace($search, $replace, $string);