!! The main program driving the matrix manipulation.  
  program main
  use globalvars
  use inout
  use transformations
  implicit none


  call readinalloc()
  call matrix_vector()
  if(do_diag) call diag_matrix()
  call write_out()
  call cleanup()

  end program main
!> @file 

