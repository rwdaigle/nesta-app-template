# Nesta CMS App Template

See this blog post for full background, installation and usage details: [http://ryandaigle.com/a/pygments-syntax-highlighting-nesta-cms-heroku](http://ryandaigle.com/a/pygments-syntax-highlighting-nesta-cms-heroku)

## Run locally

Fork this repo and clone locally. Then run:

```term
$ bundle install
Fetching git://github.com/krohrbaugh/rack-pygmoku.git
remote: Counting objects: 90, done.
...
Using bundler (1.0.15) 
Your bundle is complete! Use `bundle show [gemname]` to see where a bundled gem is installed.

$ foreman start
14:25:47 web.1     | started with pid 59647
```

Open your browser to [http://localhost:5000](http://localhost:5000) to see the site running.

## Deploying

Assuming you have a Heroku account and have successfully installed the [Heroku Toolbelt](http://toolbelt.heroku.com) [this script](https://raw.github.com/rwdaigle/nesta-app-template/master/deploy.sh) can be run to quickly deploy the site to Heroku, install any dependencies and setup the appropriate configuration.

The site will _not_ incur any charges on Heroku and doesn not use `sudo`.

```term
$ wget https://raw.github.com/rwdaigle/nesta-app-template/master/deploy.sh | sh
```