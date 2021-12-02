#!/bin/sh

composer install --no-dev -o
chmod o+w storage/*
chmod o+w storage/framework/*
