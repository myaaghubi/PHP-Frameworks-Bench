<?php

require __DIR__ . '/../libs/parse_results.php';
require __DIR__ . '/../libs/build_table.php';
require __DIR__ . '/../libs/recalc_relative.php';

$list = [
    'cake-4.2',
    'symfony-5.3.9',
    'laravel-8.6.2',
];

system('git checkout master');
$results_master = parse_results(__DIR__ . '/../output/results.hello_world.log');
system('git checkout optimize');
$results_optimize = parse_results(__DIR__ . '/../output/results.hello_world.log');
//var_dump($results_master, $results_optimize);

$is_fisrt = true;
foreach ($list as $fw) {
    $results = [];
    $results[$fw] = $results_master[$fw];
    $results[$fw . ' (*)'] = $results_optimize[$fw];
    
    $results = recalc_relative($results);
    echo build_table($results, $is_fisrt);
    $is_fisrt = false;
}
