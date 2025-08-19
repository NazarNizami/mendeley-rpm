TOPDIR=$(shell rpm --eval "%{_topdir}")

PACKAGE_NAME=mendeleydesktop


all: srpm

srpm:
	rpmdev-setuptree
	spectool -g -R $(PACKAGE_NAME).spec
	cp README.md $(TOPDIR)/SOURCES/.
	cp -f *.patch $(TOPDIR)/SOURCES/ 2>/dev/null || true
	rpmbuild -bs $(PACKAGE_NAME).spec

rpm: srpm
	rpmbuild -ba $(PACKAGE_NAME).spec

clean:
	@true


.PHONY: all srpm rpm clean
