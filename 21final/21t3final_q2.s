# read two integers and print all the integers which have their bottom 2 bits set.

main:
    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 5
    syscall
    move $t1, $v0


    # THESE LINES JUST PRINT 42
    # REPLACE THE LINES BELOW WITH YOUR CODE
    addi $t2, $t0, 1 
loop0:
    bge	 $t2, $t1, end	# if $t2 >= $t1 then end
    andi $t3, $t2, 3			# $t3 = $t2 & 3

    bne	 $t3, 3, end1	# if $t3 != 3 then end1
    
    move $a0, $t2
    li $v0, 1
    syscall
    li   $a0, '\n'
    li   $v0, 11
    syscall
end1:
    addi $t2, $t2, 1
    j loop0
    # REPLACE THE LINES ABOVE WITH YOUR CODE

end:
    li $v0, 0
    jr $31
