<?php

// r: trimg right, l: trim left, otherwise: both
$param = $argv[1];
$string = $argv[2];
$output = "";

if ($param == "r") {
    $output = rtrim($string);
} else if ($param == "l") {
    $output = ltrim($string);
} else {
    $output = trim($string);
}

echo $output;