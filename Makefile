all:
	$(MAKE) -C build all
	$(MAKE) -C build lib
	$(MAKE) -C tests all

debug:
	$(MAKE) -C build debug
	$(MAKE) -C build lib
	$(MAKE) -C tests debug

clean:
	$(MAKE) -C build clean
	$(MAKE) -C tests clean

