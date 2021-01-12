PFUNIT_DIR := ./pFUnit/build/installed/
LATEST_PFUNIT_DIR := $(lastword $(shell echo $(wildcard $(PFUNIT_DIR)/PFUNIT-4.*) | xargs -n1 | sort -V))
include $(LATEST_PFUNIT_DIR)/include/PFUNIT.mk

$(info PFUNIT_DIR="$(PFUNIT_DIR)")
$(info LATEST_PFUNIT_DIR="$(LATEST_PFUNIT_DIR)")

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

