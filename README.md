# Nesta CMS App Template

See an example of this template and the bundled [clean theme](https://github.com/rwdaigle/nesta-theme-clean) running on Heroku at [http://glowing-robot-5990.herokuapp.com/](http://glowing-robot-5990.herokuapp.com/).

See this blog post for full background, installation and usage details: [http://ryandaigle.com/a/pygments-syntax-highlighting-nesta-cms-heroku](http://ryandaigle.com/a/pygments-syntax-highlighting-nesta-cms-heroku)

## Run locally

Fork this repo on GitHub and clone locally to get the source on your local environment. Then run:

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

Open your browser to [http://localhost:5000](http://localhost:5000) to see the site running locally with default configuration values.

## Deploying

Assuming you have a Heroku account and have successfully installed the [Heroku Toolbelt](http://toolbelt.heroku.com) you can use [this script](https://raw.github.com/rwdaigle/nesta-app-template/master/deploy.sh) to quickly deploy the site to Heroku, install any dependencies and setup the appropriate configuration.

**The site will _not_ incur any charges on Heroku and does not use `sudo`. Please review the [script source](https://raw.github.com/rwdaigle/nesta-app-template/master/deploy.sh) before executing.**

```term
$ ./deploy.sh
```