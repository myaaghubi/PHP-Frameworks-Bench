#!/bin/sh
rm -rf !("_benchmark"|"Controllers"|"public"|"composer.json")
find -path './.*' -delete