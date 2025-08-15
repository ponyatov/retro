LINUX = linux-$(LINUX_VER)
LINUX_GZ = $(LINUX).tar.xz
GZ += $(DISTR)/$(LINUX_GZ)
$(DISTR)/$(LINUX_GZ):
	$(CURL) $@ https://cdn.kernel.org/pub/linux/kernel/v6.x/$(LINUX_GZ)
