PROGRAM ?= backup_dir
ETCDIR ?= /etc/$(PROGRAM)
BINDIR ?= /usr/sbin


all:
	@echo "please use make install or make uninstall"
	@echo "please use this Makefile with root"
	@echo $(USER)

install:
ifeq ($(USER),root)
	install -m 0700 -v -g 0 -o 0 "$(PROGRAM)" "$(BINDIR)/$(PROGRAM)"
	mkdir -p $(ETCDIR)
	install -m 0700 -v -g 0 -o 0 "$(PROGRAM).ini" "$(ETCDIR)/$(PROGRAM).ini"
else
	@echo "please use this Makefile as root"
endif
uninstall:
ifeq ($(USER),root)
	rm -vrf \
		"$(DESTDIR)$(BINDIR)/$(PROGRAM)" \
		"$(ETCDIR)" \
else
	@echo "please use this Makefile as root"
endif

.PHONY: install uninstall all
