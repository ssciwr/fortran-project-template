!> The global constants are stored here and passed between the subroutines
!! by including the module.
  module globalconsts
  implicit none


  integer, parameter                      :: dp = selected_real_kind(15,307)
! some complex numbers
  complex(dp),parameter                   :: c0=(0.D0,0.D0),cr=(1.D0,0.D0),ci=(0.D0,1.D0)
  real(dp),parameter                      :: pi=4.D0*DATAN(1.D0)

  end module globalconsts

!> The global variables are stored here and passed between the subroutines 
!! by including the module. You can also put these in a separate file.
!! @param matdim specifies the dimensionality of the square matrices and vectors.
!! @param matval specifies some of the values inside the matrices/vectors and should
!!        be a real number.
!! @param specifies whether matrix diagonalization should be carried out


  module globalvars
  use globalconsts
  implicit none

  integer                                 :: matdim
  real(dp)                                :: matval
  logical                                 :: do_diag
  complex(dp),dimension(:,:),allocatable  :: complex_matrix
  real(dp),dimension(:,:),allocatable     :: real_matrix
  complex(dp),dimension(:),allocatable    :: complex_vector
  real(dp),dimension(:),allocatable       :: real_vector

  end module globalvars
!> @file 

