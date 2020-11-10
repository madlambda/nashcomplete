NASHPATH?=$(HOME)/nash
INSTALL_DIR?=$(NASHPATH)/lib/nashcomplete

install: clean
	mkdir $(INSTALL_DIR)
	cp *.sh $(INSTALL_DIR)

clean:
	rm -rf $(INSTALL_DIR)
