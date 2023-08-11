<?php

require './libs/parse_results.php';
require './libs/build_table.php';

$results = glob("./output/*", GLOB_ONLYDIR);

rsort($results);

if (preg_match("/output\/(\S+)/", @$results[0], $match)) {
    echo "Results: ".@$match[1].PHP_EOL;
}

$pr = parse_results(@$results[0].'/results.log');

echo build_table($pr);
