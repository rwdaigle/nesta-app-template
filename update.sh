#!/bin/sh
git add .
git commit -m "Commit changes prior to template update"
git checkout upstream
git pull upstream master
git checkout master
git rebase upstream
cd themes/clean
git pull origin master
cd ../..
git add .
git commit -m "Pull in latest updates from app template"