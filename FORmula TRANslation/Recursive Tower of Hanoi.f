! In this example we suppose that this Hanoi Tower have 3 pegs(rods that contains the disks(in format of donuts))
program hanoi
    implicit none
    integer :: d
    character(len=10) :: arg

    ! If you want to read the number of discs from command line uncomment these two below:
    ! call get_command_argument(1, arg)
    ! read(arg, *) d
	
	d = 8 ! Usually Hanoi Towers have 8 discs
	
    call solve(d, 1, 3, 2)
end program hanoi

! It will write in the screen the enumerated pattern "Moves Count ) Origin --> Destiny"
! If you follow this procedure you solve the Hanoi Tower
recursive subroutine solve(QT_DISCS, orig, dest, temp)
    implicit none
    integer, intent(in) :: QT_DISCS, orig, dest, temp
    integer :: rank
    save rank
    data rank /0/

    if (QT_DISCS > 0) then
        call solve(QT_DISCS - 1, orig, temp, dest)
        rank = rank + 1
        write(*,'(I4, " ) ", A, " --> ", A)') rank, achar(64 + orig), achar(64 + dest)
        call solve(QT_DISCS - 1, temp, dest, orig)
    end if
end subroutine solve