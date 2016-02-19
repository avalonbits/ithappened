It Happened
===========

It Happened is an event catalog. You creat events and record every time they
happen.

This is a toy app that I'm developing to learn the [Elm programming language][1],
material design and how to develop a web app that works equally well on desktop
and mobile.

For material design I am using the excelent [MaterializeCSS][2] css + js library.


## Building and running
In order to build It Happened, make sure you've have [elm installed][3]. Then
do the following:

```bash
$ git clone https://github.com/avalonbits/ithappened.git
$ cd ithappened
$ elm-make install Main.elm --output=js/elm.js
$ python -m SimpleHTTPServer
```

This will create the app and start serving it. Go to <http://localhost:8000> and
you should be able to use it.

Have fun!

[1]: http://elm-lang.org
[2]: http://materializecss.com
[3]: http://elm-lang.org/install
