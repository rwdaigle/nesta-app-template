#!/bin/sh
heroku create -s cedar --addons memcache,newrelic
git push heroku master
cat .env | tr '\n' ' ' | xargs heroku config:add 
heroku open