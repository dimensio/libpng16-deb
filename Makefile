VERSION=1.6.17
PACKAGE=libpng16
TEMP=/tmp/libpng16

DEB_URL=http://libpng.org/pub/png/libpng.html
DEB_DESC=http://libpng.org/pub/png/libpng-manual.txt
DEB_LICENCE=ftp://ftp.simplesystems.org/pub/libpng/png/src/$(PACKAGE)/libpng-$(VERSION)-LICENSE.txt
DEB_VENDOR=dimens.io
DEB_MAINTAINER=Lovell Fuller <lovell@dimens.io>

all: compile package upload

.PHONY: clean compile package upload

clean:
	rm -f $(PACKAGE)-*.deb
	rm -rf libpng-*
	rm -rf $(TEMP)

compile:
	mkdir $(TEMP) || true
	curl -O -z libpng-$(VERSION).tar.xz http://kent.dl.sourceforge.net/project/libpng/$(PACKAGE)/$(VERSION)/libpng-$(VERSION).tar.xz
	tar xf libpng-$(VERSION).tar.xz
	cd libpng-$(VERSION) && ./configure --prefix=/usr/local --disable-static
	cd libpng-$(VERSION) && $(MAKE)
	cd libpng-$(VERSION) && $(MAKE) install DESTDIR=$(TEMP)

package:
	fpm -s dir \
      -t deb \
      -C $(TEMP) \
      --force \
      --version $(VERSION) \
      --url $(DEB_URL) \
      --description $(DEB_DESC) \
      --license $(DEB_LICENCE) \
      --vendor $(DEB_VENDOR) \
      --maintainer "$(DEB_MAINTAINER)" \
      --name $(PACKAGE)-16 \
      --package $(PACKAGE)-16-VERSION_ARCH.deb \
      --depends "libc6 >= 2.19" \
      --depends "zlib1g >= 1:1.2.8" \
      --replaces "libpng12-0 (<= $(VERSION))" \
      --replaces "libpng12-dev (<= $(VERSION))" \
      --deb-shlibs "libpng16 16 libpng16 (= $(VERSION))" \
      --deb-compression xz \
      usr/local/bin usr/local/lib
	fpm -s dir \
      -t deb \
      -C $(TEMP) \
      --force \
      --version $(VERSION) \
      --url $(DEB_URL) \
      --description $(DEB_DESC) \
      --license $(DEB_LICENCE) \
      --vendor $(DEB_VENDOR) \
      --maintainer "$(DEB_MAINTAINER)" \
      --name $(PACKAGE)-dev \
      --package $(PACKAGE)-dev-VERSION_ARCH.deb \
      --depends "zlib1g-dev >= 1:1.2.8" \
      --depends "$(PACKAGE)-16 = $(VERSION)" \
      --replaces "libpng12-0 (<= $(VERSION))" \
      --replaces "libpng12-dev (<= $(VERSION))" \
      --deb-compression xz \
      usr/local/include
