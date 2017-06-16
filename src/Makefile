# This makefile is a convenience during testing, allowing to check a
# complete build in the order pptex, dev, xpp, hol, zed, daz.

# default make target, gives a list of more useful targets
default:
	@echo "The following are the generally useful targets:"
	@echo " "
	@echo "make dir.ldd	(does cd dir; make -f dir.mkf clean, inst)"
	@echo "make dir.test	(does cd dir; make -f dir.mkf test > ../dir.test"
	@echo "make clean	(rm *.ldd *.test)"
	@echo "make all	(xpp.ldd daz.ldd, list db bin dirs)"
	@echo "make rebuild	(clean, all)"
	@echo "make testref	(make a reference copy of test outputs)"
	@echo "make diff	(diff the tests against testref)"

TET=pptex.test dev.test hol.test zed.test daz.test
DLDD=$(TET:.test=.ldd) xpp.ldd

all: $(DLDD)

test: $(TET)

diff: test
	cat *.test > testdat
	diff testref testdat > test.diff

cleantest:
	-rm *.test

clean: cleantest
	-rm *ldd testdat test.diff

rebuild: clean all

retest: cleantest test
	cat $(TET)

$(DLDD): %.ldd:
	cd $*; make -f $*.mkf clean inst
	touch $*.ldd

$(TET): %.test: %.ldd
	cd $*; make -f $*.mkf test > ../$*.test

dev.ldd: pptex.ldd

xpp.ldd: dev.ldd

hol.ldd: pptex.ldd

zed.ldd: hol.ldd

daz.ldd: zed.ldd

testref: $(TET)
	cat *.test > testref

list:
	ls -lR ../bld/bin ../bld/db
