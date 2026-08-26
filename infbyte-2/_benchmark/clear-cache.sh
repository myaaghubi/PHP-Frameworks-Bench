#!/bin/sh
# clear and rebuild production caches
php infbyte optimize:clear
php infbyte optimize
