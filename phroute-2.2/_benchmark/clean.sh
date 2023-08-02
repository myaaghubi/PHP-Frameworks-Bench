#!/bin/sh
rm -rf !("_benchmark"|"Controllers"|"composer.json"|"public")
find -path './.*' -delete