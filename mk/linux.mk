.PHONY: binutils gcc gmp mpfr mpc
binutils:
gcc:

gmp: cross/lib/libgmp.a
cross/lib/libgmp.a: $(REF)/$(GMP)/README
$(REF)/$(GMP)/README: $(DISTR)/$(GMP_GZ)
	cd $(REF) ; xzcat $< | tar x && touch $@

mpfr:
mpc:
