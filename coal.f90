module numerical_util
  implicit none
  integer, parameter:: dp=kind(0.d0) !double precision
end module   

module surfchem
  use numerical_util
  implicit none
  real (kind=dp) :: E1bof, E3
  !
  contains
  !
  subroutine read_surf_const()
    open (unit=41, file ='surf.dat',form='formatted',status='old')
    read (41,*) E1bof
    read (41,*) E3
    !not use unit 5 (keyboard) nor 6 (screen)
    close (41)
  end subroutine read_surf_const
end module 
!

program coal
  use surfchem
  !
  implicit none
  !
  call read_surf_const()
  write (6,*) E1bof, E3
  !
  
end program coal

