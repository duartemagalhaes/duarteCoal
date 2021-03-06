module numerical_util
  implicit none

  integer, parameter:: dp=kind(0.d0) !double precision
end module   

module abs_const
  use numerical_util
  implicit none
  real (kind=dp) :: NA, R0,P,T,Mco,Mco2,Mn2,Mh2o,Mh2
  !
contains
  !
  subroutine read_abs_const()
    open (unit=41, file ='abs_const.dat',form='formatted',status='old')
    read (41,*) NA
    read (41,*) R0
    read (41,*) P
    read (41,*) T
    read (41,*) Mco
    read (41,*) Mco2
    read (41,*) Mn2
    read (41,*) Mh2o
    read (41,*) Mh2
    !not use unit 5 (keyboard) nor 6 (screen)
    close (41)
  end subroutine 
end module abs_const
!
module particle
  use numerical_util
  implicit none
  real (kind=dp) :: tort,porosity,act_sites,total_sites,c,Mc,rho_char,d_particle,d_pore
  !
contains
  !
  subroutine read_particle()
    open (unit=41, file ='particle.dat',form='formatted',status='old')
    read (41,*) tort
    read (41,*) porosity
    read (41,*) act_sites
    read (41,*) total_sites
    read (41,*) c
    read (41,*) Mc
    read (41,*) rho_char
    read (41,*) d_particle
    read (41,*) d_pore
    close (41)
  end subroutine 
end module particle
!
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
    
    close (41)
  end subroutine read_surf_const
end module surfchem
!
program coal
  use surfchem
  use abs_const
  use particle
  !
  implicit none
  !
  call read_abs_const()
  write (7,*) NA,R0,P,T,Mco,Mco2,Mn2,Mh2o,Mh2
  call read_particle()
  write (8,*) tort,porosity,act_sites,total_sites,c,Mc,rho_char,d_particle,d_pore
  call read_surf_const()
  write (6,*) E1bof, E3
  !
  
end program coal
