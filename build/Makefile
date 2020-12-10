CC      = gfortran
#CC     = ifort
#intel fortran
#CFLAGS = -O3 -c -w -mkl
#gfortran debug options
#CFLAGS = -O0 -c -g -Wline-truncation -Wall -fbacktrace -ffpe-trap=zero,overflow,underflow -fbounds-check
#gfortran standard options
CFLAGS = -O3 -c 
LINK_FLAGS = -llapack -lblas
#LINK_FLAGS = -O3 -mkl

BINDIR=../bin
SRCDIR=../src
OBJ = generic_data.o input_output.o transform.o main.o

all:	$(OBJ)
	$(CC) -o $(BINDIR)/sample_program $(OBJ) $(LINK_FLAGS) 

clean:
	rm -f *.o *.mod

%.o:	$(SRCDIR)/%.f90
	$(CC) $(CFLAGS)  $<
