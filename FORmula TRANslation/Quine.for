! A "Cheat Quine"
program Quine
  implicit none
  character(len=256) :: line
  integer :: unit, ios

  open(newunit=unit, file="Quine.for", status="old", action="read", iostat=ios)
  do
     read(unit, '(A)', iostat=ios) line
     if (ios /= 0) exit
     print *, trim(line)
  end do
  close(unit)
end program Quine
