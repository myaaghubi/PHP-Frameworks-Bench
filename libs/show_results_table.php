<?php

require './libs/parse_results.php';
require './libs/build_table.php';

$results = parse_results('./output/results.hello_world.log');

echo build_table($results);
