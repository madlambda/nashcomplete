NASHPATH?=$(HOME)/nash
INSTALL_DIR?=$(NASHPATH)/lib/nashcomplete

.PHONY: install
install: uninstall
	mkdir $(INSTALL_DIR)
	cp *.sh $(INSTALL_DIR)

.PHONY: uninstall
uninstall:
	rm -rf $(INSTALL_DIR)
