# Sieve of Eratosthenes
# https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
main:

    # PUT YOUR CODE
    li $t0, 0           # int i = 0

loop0:
    bge $t0, 1000, end0	# if $t0 >= 1000 then end0
    la  $t1, prime
    add $t2, $t0, $t1

    li  $t3, 1          # int x = 1
    sb  $t3, ($t2)

    addi $t0, $t0, 1    # i = i + 1

    j	loop0			# jump to loop0
end0:
    
    li  $t0, 2          # i = 2

loop1:
    bge	$t0, 1000, end1	# if $t0 >= 1000 then end1
    
    la  $t1, prime
    add $t2, $t1, $t0

    lb  $t4, ($t2)

    bne	$t4, 1, next	# if $t4 == 1 then next
    
    move $a0, $t0       # printf("%d", i)
    li   $v0, 1
    syscall

    li  $a0, '\n'      # printf("%c", '\n');
    li  $v0, 11
    syscall

    mul $t5, $t0, 2

loop2:
    bge	$t5, 1000, next	# if $t5 >= 1000 then end1
    la  $t1, prime
    add $t2, $t1, $t5
    li  $t6, 0
    sb  $t6, ($t2)

    add $t5, $t0, $t5			# $t5 = $t5 + i
    
    j   loop2

next:
    addi $t0, $t0, 1		# $t0 = $t0 + 1
    j	loop1				# jump to loop1

end1:   

    li $v0, 0           # return 0
    jr $31

.data
prime:
    .space 1000