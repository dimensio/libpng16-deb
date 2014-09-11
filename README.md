# libpng16-deb

Compile latest libpng 1.6.x from source and package for installation on Ubuntu 14.

## What?

This repo will:

1. Download a specific version of [libpng](http://sourceforge.net/projects/libpng/files/libpng16/)
2. Compile from source
3. Package shared library _libpng16-16_ and header files _libpng16-dev_ in `.deb` format

```
bundle install
make
```

## Why?

The latest release of Ubuntu provides [libpng 1.2.51](http://packages.ubuntu.com/source/utopic/libpng) as the source of its _libpng12-0_ package.

Debian is experimenting with [libpng 1.6.10](https://packages.debian.org/source/experimental/libpng1.6) but when backported this conflicts with packages that depend on _libpng12-0_.
