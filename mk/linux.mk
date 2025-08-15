.PHONY: binutils gcc gmp mpfr mpc
binutils:
gcc:

LIBCC += --prefix $(CROSS) --disable-shared --with-gmp=$(CROSS)

GMP_CFG =
gmp: $(CROSS)/lib/libgmp.a
$(CROSS)/lib/libgmp.a: $(REF)/$(GMP)/README
	rm -rf $(TMP)/$(GMP) ; mkdir $(TMP)/$(GMP) ; cd $(TMP)/$(GMP) ;\
	$(REF)/$(GMP)/configure $(LIBCC) $(GMP_CFG) && $(MAKE) install
$(REF)/$(GMP)/README: $(DISTR)/$(GMP_GZ)
	cd $(REF) ; xzcat $< | tar x && touch $@

MPFR_CFG =
mpfr: $(CROSS)/lib/libmpfr.a
$(CROSS)/lib/libmpfr.a: $(REF)/$(MPFR)/README
	rm -rf $(TMP)/$(MPFR) ; mkdir $(TMP)/$(MPFR) ; cd $(TMP)/$(MPFR) ;\
	$(REF)/$(MPFR)/configure $(LIBCC) $(MPFR_CFG) && $(MAKE) install
$(REF)/$(MPFR)/README: $(DISTR)/$(MPFR_GZ)
	cd $(REF) ; xzcat $< | tar x && touch $@

mpc:
