#!/bin/sh
git submodule update
cd themes/clean
git checkout master
git pull origin master
cd ../..
git add themes/clean
git commit -m "Update to latest clean theme"