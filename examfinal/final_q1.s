# print a triangle of asterisks

main:
    li  $v0, 5         #   scanf("%d", &x);
    syscall
    move    $t0, $v0

    # YOU DO NOT NEED TO CHANGE THE LINES ABOVE HERE
    # CHANGE THE BELOW LINES TO YOUR CODE
    li $t1, 0           # i = 0
loop0:
    bge	 $t1, $t0, end0	# if $t1 >= $t0 then end0
    li   $t2, 0         # j = 0
loop1:
    bgt	 $t2, $t1, end1	# if $t2 > $t1 then end1
    li   $a0, '*'       #   printf("%c\n", '*');
    li   $v0, 11
    syscall
    addi  $t2, $t2, 1   # j++
    j	 loop1
end1:

    li   $a0, '\n'      #   printf("%c", '\n');
    li   $v0, 11
    syscall
    addi  $t1, $t1, 1   # i++
    j	 loop0
end0:

    # CHANGE THE ABOVE LINES TO YOUR CODE
    # YOU DO NOT NEED TO CHANGE THE LINES BELOW HERE

main__end:
    li  $v0, 0         # return 0
    jr  $ra
