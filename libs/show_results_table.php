<?php

require './libs/common.php';
require './libs/parse_results.php';
require './libs/build_table.php';

$dirs = glob("./output/*", GLOB_ONLYDIR);

// sort it by dir created date
usort($dirs, function ($a, $b) {
    return filemtime($b) - filemtime($a);
});

$index = 0;
$messagePrefix = "Benchmarks:";
if (!empty($argv[1]) && !empty($dirs[$argv[1]])) {
    $index = $argv[1];
} else {
    while (isset($dirs[$index]) && !file_exists($dirs[$index] . '/results.log')) {
        printOut("`@$dirs[$index]/results.log`", $messagePrefix, "not found!");
        $index++;
    }
}
if (!isset($dirs[$index])) {
    printOut('-', $messagePrefix);
} else if (!preg_match("/output\/(.*)/", $dirs[$index], $match)) {
    printOut("`@$dirs[$index]`", $messagePrefix, "not found!");
} else if (!file_exists($dirs[$index] . '/results.log')) {
    printOut(dateNameChecker($match[1]), $messagePrefix, "results.log not found!");
} else {
    printOut(dateNameChecker($match[1]), $messagePrefix);
}

$compareTo = $argv[2] ?? -1;
$messagePrefix = "Compare to:";
if ($compareTo >= 0 && !isset($dirs[$argv[2]])) {
    printOut("index: $argv[2]", "not exists!");
} else {
    if ($compareTo < 0) {
        $compareTo = $index + 1;
    }
    if (!isset($dirs[$compareTo])) {
        printOut('-', $messagePrefix);
    } else if (!preg_match("/output\/(.*)/", $dirs[$compareTo], $match)) {
        printOut("`$dirs[$compareTo]`", "not found!");
    } else if (!file_exists($dirs[$compareTo] . '/results.log')) {
        printOut(dateNameChecker($match[1]), "results.log not found!", $messagePrefix);
    } else {
        printOut(dateNameChecker($match[1]), $messagePrefix);
    }
}

$pr = parse_results(@$dirs[$index] . '/results.log');

if ($compareTo < 0) {
    echo build_table($pr);
} else {
    $prComp = parse_results(@$dirs[$compareTo] . '/results.log');
    echo build_table($pr, $prComp);
}

function printOut($message, $prefix = '', $extra = '')
{
    printf(" %s\t\t %s %s".PHP_EOL, $prefix, $message, $extra);
}
