#!/bin/sh
git submodule update
cd themes/clean
git checkout master
git pull origin master
cd ../..
git commit -m "Update to latest clean theme"