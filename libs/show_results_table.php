<?php

require './libs/parse_results.php';
require './libs/build_table.php';

$files = glob("./output/results.hello_world.*.log");

rsort($files);

echo @$files[0].PHP_EOL;

$results = parse_results(@$files[0]);

echo build_table($results);
