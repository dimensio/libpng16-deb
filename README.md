# libpng16-deb

Compile libpng 1.6.15 from source and package for installation on Ubuntu 14.04, 14.10 and 15.04.

## What?

This repo will:

1. Download [libpng16 source](http://sourceforge.net/projects/libpng/files/libpng16/).
2. Compile shared library from source.
3. Package shared library _libpng16-16_ and header files _libpng16-dev_ in `.deb` format.

## How?

```
bundle install
make
```

## Why?

Ubuntu still provides the legacy [libpng12](http://packages.ubuntu.com/source/vivid/libpng) via package manager.

Debian is experimenting with [libpng 1.6.10](https://packages.debian.org/source/experimental/libpng1.6) but when backported this conflicts with packages that depend on _libpng12-0_.
