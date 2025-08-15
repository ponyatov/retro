LINUX = linux-$(LINUX_VER)
LINUX_GZ = $(LINUX).tar.xz
GZ += $(DISTR)/$(LINUX_GZ)
$(DISTR)/$(LINUX_GZ):
	$(CURL) $@ https://cdn.kernel.org/pub/linux/kernel/v6.x/$(LINUX_GZ)

GMP = gmp-$(GMP_VER)
GMP_GZ = $(GMP).tar.xz
GZ += $(DISTR)/$(GMP_GZ)
$(DISTR)/$(GMP_GZ):
	$(CURL) $@ https://ftp.gnu.org/gnu/gmp/$(GMP_GZ)

MPFR = mpfr-$(MPFR_VER)
MPFR_GZ = $(MPFR).tar.xz
GZ += $(DISTR)/$(MPFR_GZ)
$(DISTR)/$(MPFR_GZ):
	$(CURL) $@ https://www.mpfr.org/mpfr-current/$(MPFR_GZ)

MPC = mpc-$(MPC_VER)
MPC_GZ = $(MPC).tar.gz
GZ += $(DISTR)/$(MPC_GZ)
$(DISTR)/$(MPC_GZ):
	$(CURL) $@ https://ftp.gnu.org/gnu/mpc/$(MPC_GZ)
