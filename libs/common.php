<?php


function dateNameChecker($string, $format="y/m/d H:i") {
    $date = validateDate($string);

    if ($date) {
        return date_format($date, $format);
    }
    return $string;
}

function validateDate($string) { 
    $possibleFormats = [
        'y-m-d',
        'Y-m-d',
        'y-m-d H:i:s',
        'Y-m-d H:i:s',
        'y-m-d\TH:i:s',
        'Y-m-d\TH:i:s',
    ];

	foreach ($possibleFormats as $format) {
        $date = DateTime::createFromFormat($format, $string);
        if ($date && $date->format($format) === $string) {
            return $date;
        }
    }

    return false;
} 