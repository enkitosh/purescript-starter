Purescript Starter
==================

Mainly a repo to hold information gathered on the adventurous exploration through the worlds of Purescript, a strongly typed programming language that compiles to Javascript.


Useful things
-------------

### Books

Purescript by Example by Phil Freeman
[Purescript by Example](https://leanpub.com/purescript/read)

### 24 days of purescript

[gist](https://gist.github.com/paf31/8e9177b20ee920480fbc)
[code](https://github.com/paf31/24-days-of-purescript)

### Purescript | Haskell

[Differences from Haskell](https://github.com/purescript/purescript/wiki/Differences-from-Haskell)

### Build system | Package manager
[Pulp](https://github.com/bodil/pulp)

### Task runners 

#### Gulp
[gulp-purescript](https://github.com/purescript-contrib/gulp-purescript)

#### Grunt
[grunt-purescript](https://github.com/purescript-contrib/grunt-purescript)

Purescript installation
-----------------------

    cabal update
    cabal install purescript

To verify that you now have the purescript compiler try typing

    psc


Purescript files are called purs.

Example
    
    Main.purs

    module Main where

    import Debug.Trace

    main = trace "Hello World"

build and output to .js (--main being the name of the main module)

    psc Main.purs --output Main.js --main=Main

Run

    node Main.js

Should execute the code and return Hello World


Running the code in this repo
-----------------------------

    git clone https://github.com/enkitosh/purescript-starter
    cd purescript-starter

Install pulp

    npm install -g pulp

Install dependencies

    bower install

Main module is in src/Main.purs
Modify the code then

    pulp build

Use browserify to convert your module to use the code in your browser

    pulp browserify > output/build.js

View your changes at /index.html

Feel free to contribute to this repository :-)
