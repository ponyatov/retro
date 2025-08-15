.PHONY: gmp mpfr mpc cclibs binutils gcc
binutils:
gcc:

LIBCC += --prefix $(CROSS) --disable-shared --with-gmp=$(CROSS)

GMP_CFG =
gmp: $(CROSS)/lib/libgmp.a
$(CROSS)/lib/libgmp.a: $(REF)/$(GMP)/README
	rm -rf $(TMP)/$(GMP) ; mkdir $(TMP)/$(GMP) ; cd $(TMP)/$(GMP) ;\
	$(REF)/$(GMP)/configure $(LIBCC) $(GMP_CFG) && $(MAKE) install-strip
$(REF)/$(GMP)/README: $(DISTR)/$(GMP_GZ)
	cd $(REF) ; xzcat $< | tar x && touch $@

MPFR_CFG =
mpfr: $(CROSS)/lib/libmpfr.a
$(CROSS)/lib/libmpfr.a: $(REF)/$(MPFR)/README
	rm -rf $(TMP)/$(MPFR) ; mkdir $(TMP)/$(MPFR) ; cd $(TMP)/$(MPFR) ;\
	$(REF)/$(MPFR)/configure $(LIBCC) $(MPFR_CFG) && $(MAKE) install-strip
$(REF)/$(MPFR)/README: $(DISTR)/$(MPFR_GZ)
	cd $(REF) ; xzcat $< | tar x && touch $@

MPC_CFG =
mpc: $(CROSS)/lib/libmpc.a
$(CROSS)/lib/libmpc.a: $(REF)/$(MPC)/README
	rm -rf $(TMP)/$(MPC) ; mkdir $(TMP)/$(MPC) ; cd $(TMP)/$(MPC) ;\
	$(REF)/$(MPC)/configure $(LIBCC) $(MPC_CFG) && $(MAKE) install-strip
$(REF)/$(MPC)/README: $(DISTR)/$(MPC_GZ)
	cd $(REF) ; zcat $< | tar x && touch $@

cclibs: gmp mpfr mpc

BINUTILS_CFG += --disable-nls --target=$(TARGET)
BINUTILS_CFG += --with-sysroot=$(ROOT) --with-native-system-header-dir=/include
BINUTILS_CFG += --enable-lto --disable-multilib
binutils:
