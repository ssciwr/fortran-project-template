!> Module containing the matrix transformations
  module transformations

  contains

!> Matrix-vector multiplication using level 2 BLAS routines.
!! See http://www.netlib.org/lapack/explore-html/d7/d15/group__double__blas__level2_gadd421a107a488d524859b4a64c1901a9.html
!! and http://www.netlib.org/lapack/explore-html/dc/dc1/group__complex16__blas__level2_gafaeb2abd9fffa7442b938dc384aeaf47.html
  subroutine matrix_vector()
  use globalvars
  implicit none


! variables required for the BLAS calls
  character                            :: trans
  integer                              :: i, j
  real(dp)                             :: alpha, beta
  complex(dp)                          :: calpha, cbeta
  real(dp),dimension(:),allocatable    :: work
  complex(dp),dimension(:),allocatable :: cwork

  alpha = 1.0_dp
  beta = 0.0_dp
  calpha = cr
  cbeta = c0

  allocate(work(matdim))
  allocate(cwork(matdim))

  real_vector(:)= 1.0_dp
  complex_vector(:)= cr

! set real_matrix and complex_matrix as the identity matrix
  forall(i=1:matdim, j=1:matdim) real_matrix(i,j) = (i/j)*(j/i)
  forall(i=1:matdim, j=1:matdim) complex_matrix(i,j) = (i/j)*(j/i)
! set diagonal entries to matval/i*matval instead of 1  
  real_matrix(:,:)=real_matrix(:,:)*matval
  complex_matrix(:,:)=complex_matrix(:,:)*ci*matval

  trans = 'N'
  call dgemv(trans,matdim,matdim,alpha,real_matrix,matdim,real_vector,1,beta,work,1)
! the result of the multiplication is in work. Copy over to real_vector.
  real_vector = work

  call zgemv(trans,matdim,matdim,calpha,complex_matrix,matdim,complex_vector,1,cbeta,cwork,1)
! the result of the multiplication is in cwork. Copy over to complex_vector.
  complex_vector = cwork


  deallocate(work)
  deallocate(cwork)

  end subroutine matrix_vector

!> Matrix diagonalization using lapack routines.
!! See http://www.netlib.org/lapack/explore-html/d2/d8a/group__double_s_yeigen_ga442c43fca5493590f8f26cf42fed4044.html#ga442c43fca5493590f8f26cf42fed4044
!! and http://www.netlib.org/lapack/explore-html/df/d9a/group__complex16_h_eeigen_gaf23fb5b3ae38072ef4890ba43d5cfea2.html#gaf23fb5b3ae38072ef4890ba43d5cfea2
  subroutine diag_matrix()
  use globalvars
  implicit none
    
! variables required for the BLAS calls
  character                            :: jobz, uplo
  integer                              :: lwork, info
  real(dp),dimension(:),allocatable    :: work, rwork
  complex(dp),dimension(:),allocatable :: cwork

  real_matrix(:,:) = matval
  complex_matrix(:,:) = matval*cr

  lwork = 3*matdim-1
  allocate(work(lwork))

  jobz = 'V'
  uplo = 'U'

  call dsyev(jobz,uplo,matdim,real_matrix,matdim,real_vector,work,lwork,info)
  if(info.eq.0) then
    write(*,*) "Diagonalization of real matrix successful!"
  endif
  deallocate(work)

  lwork = 2*matdim-1
  allocate(work(matdim))
  allocate(cwork(lwork))
  allocate(rwork(3*matdim-2))
  call zheev(jobz,uplo,matdim,complex_matrix,matdim,work,cwork,lwork,rwork,info)
  if(info.eq.0) then
    write(*,*) "Diagonalization of complex matrix successful!"
  endif
! The eigenvalues of hermitian matrices are real. We have to copy over the values from work with is a real vector into 
! complex_vector for the printout.
  complex_vector(:) = work
  deallocate(work,cwork,rwork)
  
  end subroutine diag_matrix
!> @file 


end module transformations