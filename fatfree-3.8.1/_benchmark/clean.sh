#!/bin/sh
rm -rf !("_benchmark"|"Controllers"|"composer.json"|"index.php")
find -path './.*' -delete