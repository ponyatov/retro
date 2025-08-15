.PHONY: binutils gcc gmp mpfr mpc
binutils:
gcc:

LIBCC += --prefix $(CROSS) --disable-shared

gmp: cross/lib/libgmp.a
cross/lib/libgmp.a: $(REF)/$(GMP)/README
	rm -rf $(TMP)/$(GMP) ; mkdir $(TMP)/$(GMP) ; cd $(TMP)/$(GMP) ;\
	$(REF)/$(GMP)/configure $(LIBCC) && $(MAKE) install
$(REF)/$(GMP)/README: $(DISTR)/$(GMP_GZ)
	cd $(REF) ; xzcat $< | tar x && touch $@

mpfr:
mpc:
