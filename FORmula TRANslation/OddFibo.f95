! Odd Fibonacci Factorial Sum and Product

! Main idea, the program iterates over 8 numbers, and computes a Fibonacci Sequence, in each iteration it prints if the fibonacci number is odd or even, writes in the screen the fizzbuzz logic based on the current fibonacci number, the actual number enumerated and the fibonacci one, and the factorial of the fibonnaci number, and in the end it writes the sum and the product of the fibonacci values
program odd_fibo
	implicit none
	integer :: count_num, end_num
	integer(kind = 16) :: i, n, fact, fibo, sum_total, prod_total
	! i =  counter, n = our number(that would be computed with factorial, fibonacci, etc)
	integer a, b ! Fibonacci Computation
	
	sum_total = 0
	prod_total = 1
	
	end_num = 8 ! Iterate 8 times
	do count_num = 0, end_num
		n = count_num
		! Computes Fibonacci
		!a = 0
        !fibo = 1
        !do i = 0, n
        !    b = a + fibo
        !    a = fibo
        !    fibo = b
        !end do
		if (n == 0) then
            fibo = 0
        else if (n == 1) then
            fibo = 1
        else
            a = 0
            b = 1
            do i = 2, n
                fibo = a + b
                a = b
                b = fibo
            end do
        end if
		! Assign n = fibo(Because I want to compute the fibonacci value)
		print *, "Current number:", n, ", Fibonacci:", fibo
		n = fibo
		! Odd or Even
		if (mod(n, 2) == 0) then
			print *, "is even -> ", n
		else
			print *, "is odd -> ", n
		end if
		! FizzBuzz
		if (mod(n, 3) == 0 .and. mod(n, 5) == 0) then
            print *, "FizzBuzz"
        else if (mod(n, 3) == 0) then
            print *, "Fizz"
        else if (mod(n, 5) == 0) then
            print *, "Buzz"
        else
            print *, n
        end if
		! Factorial
		fact = 1
		if (fibo > 1) then
            do i = 2, fibo
                fact = fact * i
            end do
        end if
		print *, "Factorial:", fact
		! Sum and products(in the same loop)
		sum_total = sum_total + fibo
		prod_total = prod_total * max(1, fibo) ! To not n * 0
	end do
	print *, "Sum of Fibonacci Sequence of ", end_num, " = ", sum_total
	print *, "Product of Fibonacci Sequence of ", end_num, " = ", prod_total
end program odd_fibo