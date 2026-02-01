<?php

function build_table($res1, $res2 = null, $headerGenerate = true)
{
    $table = '';
    $line = '|-----------------------|----------------------:|---------------:|-----------------:|---------------:|-------------:|' . PHP_EOL;

    if ($headerGenerate) {
        $table .= $line . '| framework             | requests/second (rps) | relative (rps) | memory peak (mb) | relative (mem) | error & fail |' . PHP_EOL . $line;
    }

    if (!$res1) {
        $table .= makeFormattedText('The "output" folder is empty!', $line);
        $table .= makeFormattedText('Run a benchmark first:', $line);
        $table .= makeFormattedText('bash setup.sh -h', $line);
        $table .= makeFormattedText('bash benchmark.sh -h', $line);
        return $table;
    }

    foreach ($res1 as $fw => $result) {
        $comp['rps'] = '(-)';
        $comp['memory'] = '(-)';
        
        // the percentage of failed requests to the whole requests
        $comp['errors'] = $result['errors'] <= 0 ? '0.0%' : number_format(($result['errors'] / $result['duration']) * 100 / $result['rps'], 1) . '%';

        if (!empty($res2[$fw])) {
            $comp['rps'] = '(' . calcPercentage($result['rps'], $res2[$fw]['rps']) . ')';
            $comp['memory'] = '(' . calcPercentage($result['memory'], $res2[$fw]['memory']) . ')';
        }

        $table .= sprintf(
            "| %-22s|%22s |%15s |%17s |%15s |%13s |" . PHP_EOL,
            $fw,
            number_format($result['rps'], 2) . ' ' . @$comp['rps'],
            is_numeric($result['rps_relative']) ? number_format($result['rps_relative'], 1) : $result['rps_relative'],
            number_format($result['memory'], 2) . ' ' . @$comp['memory'],
            is_numeric($result['memory_relative']) ? number_format($result['memory_relative'], 1) : $result['memory_relative'],
            @$comp['errors']
        );
    }

    return $table . $line;
}

function makeFormattedText($text, $header="") {
    $textLen = strlen($text);
    $textLen += $textLen%2==0?0:1;

    # to fit with the header
    $sLen = (strlen($header) - $textLen) / 2 - 1;

    return sprintf("|%{$sLen}s%{$textLen}s%{$sLen}s|\n", '', $text, '');
}

function calcPercentage($targetNumber, $baseNumber)
{
    if (!is_numeric($targetNumber) || !is_numeric($baseNumber) || $baseNumber <= 0) {
        return '-';
    }

    $diff = $targetNumber - $baseNumber;
    $percentage = ($diff / $baseNumber) * 100;
    if ($percentage == 0)
        return '0%';
    return number_format($percentage, 1) . '%';
}
