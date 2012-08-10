GLib Docset
===========

GLib Docset is a [GLib](http://developer.gnome.org/glib/) docset for dash.
Currently this is the documentation for GLib 2.32.3.

Requirements
------------

* [Dash](http://kapeli.com/dash/) is a snippet manager and documentation browser for OS X.

Usage
-----

Place the Glib.docset directory at dash docset directory.
This is usually located at `~/Library/Application\ Support/Dash/DocSets`.

Script
------

`src` directory contains the automated docset generation script.
To execute, modify the `API` and `MODULE` variable in `src/process.sh` to point to appropriate path.

    $ process.sh

This will create `docSet.dsidx` file.
This should be placed in `Glib.docset/Contents/Resources`.
