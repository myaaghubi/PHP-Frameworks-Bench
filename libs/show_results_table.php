<?php

require './libs/parse_results.php';
require './libs/build_table.php';

$results = glob("./output/*", GLOB_ONLYDIR);

rsort($results);

$index = 0;

if (!empty($results[$argv[1]])) {
    $index = $argv[1];
}

if (preg_match("/output\/(\S+)/", @$results[$index], $match)) {
    echo " Results:\t\t" . @$match[1] . PHP_EOL;
}

$compareTo = -1;

if (!empty($results[$argv[2]])) {
    $compareTo = $argv[2];
} else if (!empty($results[$index+1])) {
    $compareTo = $index+1;
}

if ($compareTo>=0 && preg_match("/output\/(\S+)/", @$results[$compareTo], $match)) {
    echo " Compare to:\t\t" . @$match[1] . PHP_EOL;
}

echo '|-------------------|------------------------:|-------------:|----------:|-------------:|'.PHP_EOL;

$pr = parse_results(@$results[$index] . '/results.log');

if ($compareTo<0) {
    echo build_table($pr);
} else {
    $prComp = parse_results(@$results[$compareTo] . '/results.log');
    echo build_table($pr, $prComp);
}
