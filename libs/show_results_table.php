<?php

require './libs/parse_results.php';
require './libs/build_table.php';

$results = glob("./output/*", GLOB_ONLYDIR);

rsort($results);

$index = 0;
if (!empty($argv[1]) && $argv[1]<count($results)) {
    $index = $argv[1];
}

if (preg_match("/output\/(\S+)/", @$results[$index], $match)) {
    echo "Results: ".@$match[1].PHP_EOL;
}

$pr = parse_results(@$results[$index].'/results.log');

echo build_table($pr);
