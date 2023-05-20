#!/bin/sh
rm -rf !("_benchmark"|"Controllers"|"composer.json"|"web")
find -path './.*' -delete