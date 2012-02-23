# Nesta CMS App Template

See an example of this template and the bundled [clean theme](https://github.com/rwdaigle/nesta-theme-clean) running on Heroku at [http://nesta-app-template.herokuapp.com/](http://nesta-app-template.herokuapp.com/).

![App template screenshote](http://f.cl.ly/items/181g441O352Z2M0M1S2J/Screen%20shot%202012-02-20%20at%204.36.37%20PM.png)

See this blog post for full background, installation and usage details: [http://ryandaigle.com/a/deploying-nesta-cms-blog-heroku-cedar-pygments-syntax-highlighting](http://ryandaigle.com/a/deploying-nesta-cms-blog-heroku-cedar-pygments-syntax-highlighting)

## Run locally

Fork this repo on GitHub and clone locally to get the source on your local environment. Then run:

```term
$ ./bootstrap.sh

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

## Next

Once the app is running view the [Getting Started with the Nesta CMS App Template](http://nesta-app-template.herokuapp.com/welcome) entry to see how to customize, update and maintain the site.

![Getting started](http://f.cl.ly/items/2q3X3J3T0M2D1f372f1V/Screen%20shot%202012-02-20%20at%204.38.39%20PM.png)