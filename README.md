# libpng16-deb

Compile latest libpng 1.6.x from source and package for installation on Ubuntu 14.

[![Latest packages](https://drone.io/github.com/dimensio/libpng16-deb/status.png)](https://drone.io/github.com/dimensio/libpng16-deb/files)

## What?

This repo will:

1. Download a [specific version](https://github.com/dimensio/libpng16-deb/blob/master/Makefile#L1) of [libpng](http://sourceforge.net/projects/libpng/files/libpng16/).
2. Compile shared library from source.
3. Package shared library _libpng16-16_ and header files _libpng16-dev_ in `.deb` format.

## How?

```
bundle install
make
```

## Why?

The latest release of Ubuntu provides [libpng 1.2.51](http://packages.ubuntu.com/source/utopic/libpng) as the source of its _libpng12-0_ package.

Debian is experimenting with [libpng 1.6.10](https://packages.debian.org/source/experimental/libpng1.6) but when backported this conflicts with packages that depend on _libpng12-0_.
