# This makefile is a convenience during testing, allowing to check a
# complete build in the order pptex, dev, xpp, hol, zed, daz.

pptex.ldd:
	cd pptex; make -f pptex.mkf clean; make -f pptex.mkf inst
	touch pptex.ldd

dev.ldd:	pptex.ldd
	cd dev; make -f dev.mkf clean; make -f dev.mkf inst
	touch dev.ldd

xpp.ldd:	pptex.ldd
	cd xpp; make -f xpp.mkf clean; make -f xpp.mkf inst
	touch xpp.ldd

hol.ldd:	dev.ldd
	cd hol; make -f hol.mkf clean; make -f hol.mkf inst
	touch hol.ldd

zed.ldd:	hol.ldd
	cd zed; make -f zed.mkf clean; make -f zed.mkf inst
	touch zed.ldd

daz.ldd:	zed.ldd
	cd daz; make -f daz.mkf clean; make -f daz.mkf inst
	touch daz.ldd

lsb:
	ls -lR ../bld/bin ../bld/db

