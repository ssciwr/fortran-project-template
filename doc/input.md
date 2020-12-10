Here goes a description of the input required for your program.

# Program input

The input parameters are given in the file `data.inp`. Input blocks are currently surrounded by `$start ... $end`. There are three input parameters, `matdim` which sets the dimensionality of the square matrices and vectors and is a positive integer, `matval` which is used to fill the matrices/vectors and is a real number, and the logical `do_diag` which specifies if the matrix diagonalization should be carried out. 

The output is written to `data.out` and currently contains a real and a complex matrix after transformation when no diagonalization is performed; or the eigenvectors and eigenvalues if diagonalization is carried out.