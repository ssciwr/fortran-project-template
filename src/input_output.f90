!> Module handling input and output, data structures.
  module inout

  contains

!> This subroutine will read in the data from data.inp and
!! allocate the arrays.
!! @param file units: 20 - input, 
!!              21 - output
  subroutine readinalloc()
  use globalvars
  implicit none

  integer                  :: io_stat,myindex
  character(len=256)       :: line
  character(len=1)         :: delimiter

  
  open(20,FILE='data.inp',status='old',action='read',delim='apostrophe',iostat=io_stat)
  delimiter='='

  write(*,*) "Reading input file.."
  do while (io_stat.EQ.0)
    read(20,*,iostat=io_stat) line
    if(index(trim(line),"$start").ne.0) then
      write(*,*) "Reading matrix and vector dimension.."
      do while(index(trim(line),"$end").eq.0)
        read(20,*) line
        if(index(trim(line),"matdim").ne.0) then
          myindex = scan(line,delimiter)
          read(line(myindex+1:),*) matdim
        endif
        if(index(trim(line),"matval").ne.0) then
          myindex = scan(line,delimiter)
          read(line(myindex+1:),*) matval
        endif
        if(index(trim(line),"do_diag").ne.0) then
          myindex = scan(line,delimiter)
          read(line(myindex+1:),*) do_diag
        endif
      enddo
    endif
  enddo
  close(20)


  write(*,*) "Found matrix/vector dimension:", matdim
  write(*,*) "Found matrix/vector value:", matval
  write(*,*) "Found diagonalization:", do_diag
  write(*,*) "Allocating arrays.."
  allocate(real_matrix(matdim,matdim))
  allocate(complex_matrix(matdim,matdim))
  allocate(real_vector(matdim))
  allocate(complex_vector(matdim))

  end subroutine readinalloc
 

!> This subroutine will deallocate the arrays.
  subroutine cleanup()
  use globalvars
  implicit none


  deallocate(real_matrix,complex_matrix,real_vector,complex_vector)
  write(*,*) "Deallocated arrays."

  end subroutine cleanup

!> This subroutine contains the writing of the transformed matrices to data.out.
  subroutine write_out()
  use globalvars
  implicit none  


  integer                  :: io_stat,i,j
  character(len=50)        :: outformat1,outformat2

  outformat1='(e23.16)'
  outformat2='(2(e23.16,2X))'

  write(*,*) "Writing data to file"
  open(21,FILE="data.out",status='replace',action='write',iostat = io_stat)

  do i=1,matdim
    do j=1,matdim
      write(21,outformat1) real_matrix(j,i)
    enddo
  enddo
  do i=1,matdim
    do j=1,matdim
      write(21,outformat2) complex_matrix(j,i)
    enddo
  enddo
  if(do_diag) then
    do i=1,matdim
      write(21,outformat1) real_vector(i)
    enddo
    do i=1,matdim
      write(21,outformat2) complex_vector(i)
    enddo
  endif
  close(21)

  end subroutine write_out
!> @file

  end module inout