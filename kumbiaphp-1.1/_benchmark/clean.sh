#!/bin/sh
find . -path ./_benchmark -prune -o -exec rm -rf {} \; 2> /dev/null

rm -rf _benchmark/temp