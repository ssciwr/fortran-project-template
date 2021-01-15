FC = gfortran
PFUNIT_DIR := ../pFUnit/build/installed/
LATEST_PFUNIT_DIR := $(lastword $(shell echo $(wildcard $(PFUNIT_DIR)/PFUNIT-4.*) | xargs -n1 | sort -V))
include $(LATEST_PFUNIT_DIR)/include/PFUNIT.mk

all: unit_test

FFLAGS += $(PFUNIT_EXTRA_FFLAGS)
FFLAGS += -I../build 

# debug options for gfortran
debug: FFLAGS += -O0 -c -g -Wline-truncation -Wall -fbacktrace -ffpe-trap=zero,overflow,underflow -fbounds-check
debug: unit_test

%.o : %.F90
	$(FC) -c $(FFLAGS) $<

unit_test_TESTS := test_transform.pf
unit_test_OTHER_LIBRARIES := -L../build -lsut -llapack -lblas
$(eval $(call make_pfunit_test,unit_test))


clean:
	$(RM) *.o *.mod *.a  *.inc
	$(RM) test_transform.F90

