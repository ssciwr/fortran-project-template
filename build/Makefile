FC      = gfortran
FFLAGS = -O3 -c 
LINK_FLAGS = -llapack -lblas

BINDIR=../bin
SRCDIR=../src
OBJ = generic_data.o input_output.o transform.o main.o

all: $(BINDIR)/sample_program

$(BINDIR)/sample_program: $(OBJ)
	$(FC) -o $(BINDIR)/sample_program $(OBJ) $(LINK_FLAGS) 

# debug options for gfortran
debug: FFLAGS += -O0 -c -g -Wline-truncation -Wall -fbacktrace -ffpe-trap=zero,overflow,underflow -fbounds-check
debug: $(BINDIR)/sample_program

lib: libsut.a

libsut.a: $(OBJ)
	$(AR) -r $@ $?

clean:
	rm -f *.o *.mod *.inc *.a

%.o:	$(SRCDIR)/%.f90
	$(FC) $(FFLAGS)  $<
