CC      = gfortran
#CC     = ifort
PFUNIT_DIR := /home/inga/programs/pFUnit/build/installed
LATEST_PFUNIT_DIR := $(lastword $(shell echo $(wildcard $(PFUNIT_DIR)/PFUNIT-4.*) | xargs -n1 | sort -V))
include $(LATEST_PFUNIT_DIR)/include/PFUNIT.mk
FFLAGS += $(PFUNIT_EXTRA_FFLAGS)
FFLAGS += -I../src
FFLAGS += -I../build
#intel fortran
#CFLAGS = -O3 -c -w -mkl
#gfortran debug options
#CFLAGS = -O0 -c -g -Wline-truncation -Wall -fbacktrace -ffpe-trap=zero,overflow,underflow -fbounds-check
#gfortran standard options
CFLAGS = -O3 -c $(FFLAGS) 
LINK_FLAGS = -llapack -lblas
#LINK_FLAGS = -O3 -mkl


all: my_test

%.o : %.f90
	$(CC) -c $(CFLAGS) $<

my_test := test_transform.pf
my_test_OTHER_LIBRARIES := -L../build -lsut
$(eval $(call make_pfunit_test,my_test))

clean:
	rm -f *.o *.mod *.inc *.a my_test

