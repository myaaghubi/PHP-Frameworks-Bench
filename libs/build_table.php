<?php

function build_table($res1, $res2 = null, $header = true)
{
    $table = '';

    if ($header) {
        $table .= '|framework          |requests per second (rps)|relative (rps)|peak memory|relative (mem)|' . "\n";
        $table .= '|-------------------|------------------------:|-------------:|----------:|-------------:|' . "\n";
    }

    if (!$res1) {
        $text = 'Table is empty!';
        $lLen = 87;
        $lELen = ($lLen - strlen($text)) / 2;

        $table .= sprintf("|%" . $lELen . "s%" . strlen($text) . "s%" . $lELen . "s|\n", '', $text, '');
        return $table;
    }

    foreach ($res1 as $fw => $result) {
        $comp['rps'] = '(-)';
        $comp['memory'] = '(-)';
        if (!empty($res2[$fw])) {
            $comp['rps'] = '(' . culc_percentage($result['rps'], $res2[$fw]['rps']) . '%)';
            $comp['memory'] = '(' . culc_percentage($result['memory'], $res2[$fw]['memory']) . '%)';
        }

        $table .= sprintf(
            "|%-19s|%25s|%14s|%11s|%14s|\n",
            $fw,
            number_format($result['rps'], 2) . ' ' . @$comp['rps'],
            number_format($result['rps_relative'], 1),
            number_format($result['memory'], 2) . ' ' . @$comp['memory'],
            number_format($result['memory_relative'], 1)
        );
    }

    return $table;
}

function culc_percentage($targetNumber, $baseNumber)
{
    $diff = $targetNumber - $baseNumber;
    $percentage = ($diff / $baseNumber) * 100;
    if ($percentage==0)
        return 0;
    return number_format($percentage, 1);
}
