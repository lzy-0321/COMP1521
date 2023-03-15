# read an integer
# print 1 iff  the least significant bit is equal to the most significant bit
# print 0 otherwise

main:
    li   $v0, 5
    syscall


    # THESE LINES JUST PRINT 42
    # REPLACE THE LINES BELOW WITH YOUR CODE
    move $t0, $v0

    andi $t1, $t0, 0			# $t1 = $t0 & 0
    andi $t2, $t0, 1			# $t2 = $t0 & 1
    blt	 $t0, 0, negative	    # if $t0 < 0 then negative
    beq $t1, $t2, print_1		# if $t1 == $t2, print 1
    j print_0

negative:
    beq $t1, $t2, print_0		# if $t1 == $t2, print 0
    j print_1

print_0:
    li $a0, 0
    li $v0, 1
    syscall
    li   $a0, '\n'
    li   $v0, 11
    syscall

    j end

print_1:
    li $a0, 1
    li $v0, 1
    syscall
    li   $a0, '\n'
    li   $v0, 11
    syscall

    j end
    # REPLACE THE LINES ABOVE WITH YOUR CODE


end:
    li $v0, 0
    jr $31
