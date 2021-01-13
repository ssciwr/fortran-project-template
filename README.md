# Content of *your* source code documentation #  

- Name and short description of the software, authors, date of initial development
- Main features
- Main requirements
- Further information:
    - [Input examples and explanations, step-by-step tutorial](input.md)
    - [More detailed description of scientific approach and input variables reference](method.md)
    - [Validity range of the parameters](parameters.md)
    - [License, bug tracker, references, citations](further.md)
    - [Source code description](doc/sphinxdoc.md) - functions and classes, modules, variables

# fortran-project-template # 

This is a template for your software project. The example code performs a matrix-vector multiplication for real and complex matrices/vectors, and a matrix diagonalization routine per the respective LAPACK routines.

*Scientific Software Center, Heidelberg University, 12/2020*

The program requires a fortran compiler, BLAS/LAPACK libraries, doxygen/graphviz for the documentation, and pFUnit, which is used for the unit testing. To install these on i.e. ubuntu, type `source requirements.txt`.

Compile the source code with `make` in the main directory. This will place the compiled program in `./bin` and also compile the unit tests which are contained in the folder `./tests`. The input parameters are contained in `run/data.inp` and output is written to `data.out`. To execute the program, cd into the `run` directory and execute `../bin/sample_program`.

## github actions

This repository contains a github action in `./github/workflows/`. This will run unit tests upon push to the master branch and upon pull request. The action can also be run manually in the "Actions" tab on the github website.

### Testing
You should always test your code against a reference. In this template, we used [https://github.com/Goddard-Fortran-Ecosystem/pFUnit](pFUnit) for the unit tests (parallel funit).

So far, only *unit tests* are included in the code template (that is, tests of a specific component of the software), but as you develop your software, you should also add `integration tests` that check the overall behaviour of your code.

In the github action, the tests are performed under the ubuntu operating system, ideally you would ensure that the code runs also on other operating systems.

### Source Code Documentation: Functions, modules, classes, ...
The documentation should be updated as you update your code. Include appropriate method descriptions in your code and running `doxygen` in the `doc` directory will update the documentation html for your functions, classes, etc. On your local machine, you can navigate to `doc/index.html` and check the styling.
If your code is in a public repository, you can push your documentation to [Read the docs](https://readthedocs.org/) or github pages.
