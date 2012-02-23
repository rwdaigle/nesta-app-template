#!/bin/sh
bundle install
git submodule update -i
git remote add upstream git://github.com/rwdaigle/nesta-app-template.git
git checkout -b upstream
git pull upstream master
git checkout master