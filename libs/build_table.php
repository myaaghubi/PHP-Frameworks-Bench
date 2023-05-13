<?php

function build_table($results, $header = true)
{
    $table = '';

    if ($header) {
        $table .= '|framework          |requests per second (rps)|relative (rps)|peak memory|relative (mem)|' . "\n";
        $table .= '|-------------------|------------------------:|-------------:|----------:|-------------:|' . "\n";
    }

    if (!$results) {
        $text = 'Table is empty!';
        $lLen = 87;
        $lELen = ($lLen - strlen($text))/2;
        
        $table .= sprintf("|%".$lELen."s%".strlen($text)."s%".$lELen."s|\n", '', $text, '');
        return $table;
    }
    
    foreach ($results as $fw => $result) {
        $table .= sprintf(
            "|%-19s|%25s|%14s|%11s|%14s|\n",
            $fw,
            number_format($result['rps'], 2),
            number_format($result['rps_relative'], 1),
            number_format($result['memory'], 2),
            number_format($result['memory_relative'], 1)
        );
    }

    return $table;
}
