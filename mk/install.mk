.PHONY : install update ref gz
install: $(WS)_install $(PIP) doc ref gz
	$(MAKE) update
update : $(WS)_update  $(PIP)
	$(RUSTUP) self update && $(RUSTUP) update
ref    : $(REF)
gz     : $(GZ)

Debian_install:
# sudo dpkg --add-architecture i386
Debian_update:
	sudo apt update
	sudo apt install -uy `cat apt.$(WS)` $(APT)
