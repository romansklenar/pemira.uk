Pemira Jewellery
================

This is the [Middleman](http://middlemanapp.com/) source for [Pemira Jewellery](pemira.uk) website.

For instructions how to start with Middleman please check its [Getting Started](http://middlemanapp.com/basics/getting-started/) guide.


What's required
---------------

[Ruby](https://www.ruby-lang.org/) for middleman
[NPM](https://npmjs.org) and [Bower](http://bower.io) for javascript dependancies


What's included
---------------

* A simple Bootstrap v3 template with fixed top navigation and sticky footer.
* jQuery and Bootstrap javascript installed by [Bower](http://bower.io)
* The Bootstrap 3 branch from [twbs/bootstrap-sass](https://github.com/twbs/bootstrap-sass) for Bootstrap SASS
* [Slim Templates](http://slim-lang.com)


Setup
-----

    $ brew install node
    $ npm install bower
    $ cd pemira
    $ bower install
    $ bundle


Run
---

    $ bundle exec middleman
    $ open http://0.0.0.0:4567

**Optional:** Instead of running server by `middleman` command every time you can use [Pow](http://pow.cx/) to run website as Rack application under `pemira.dev` domain.

    $ cd ~/.pow
    $ ln -s ~/Sites/pemira
    $ open http://pemira.dev

Build
-----

    $ bundle exec middleman build



Deploy
------

    $ bundle exec middleman deploy
