# HW ?= pc
HW ?= qemu386
# HW ?= opi800

include   hw/$(HW)/$(HW).mk
include  cpu/$(CPU)/$(CPU).mk
include arch/$(ARCH)/$(ARCH).mk
include   os/$(OS)/$(OS).mk

.PHONY: qemu
qemu: bin/$(BINFILE).iso
	$(QEMU) $(QEMU_CFG) -boot d -cdrom $<
