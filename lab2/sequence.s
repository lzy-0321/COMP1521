main:
    li    $t0, 0                #int start
    li    $t1, 0                #int stop
    li    $t2, 0                #int step
    li    $t3, 0                #int i

    la   $a0, string0           # printf("Enter the starting number: ");
    li   $v0, 4
    syscall

    li   $v0, 5                 # scanf("%d", &start);
    syscall

    move $t0, $v0

    la   $a0, string1           # printf("Enter the stopping number: ");
    li   $v0, 4
    syscall

    li   $v0, 5                 # scanf("%d", &stop);
    syscall

    move $t1, $v0

    la   $a0, string2           # printf("Enter the step size: ");
    li   $v0, 4
    syscall

    li   $v0, 5                  # scanf("%d", &step);
    syscall

    move $t2, $v0
    move $t3, $t0

    bge	 $t1, $t0, nextcheck	# if $t0 >= $t1 then nextcheck
    blt  $t2, $0, loop1         # if $t2 < $t0 then loop

nextcheck:
    ble	 $t1, $t0, end	        # if $t1 <= $t0 then end
    bgt	 $t2, $t0, loop2        # if $t0 > $t1 then target
    
loop1:
    blt	 $t3, $t1, end
    move $a0, $t3
    li   $v0, 1
    syscall

    li   $a0, '\n'             #   printf("%c", '\n');
    li   $v0, 11
    syscall

    add	 $t3, $t2, $t3		   # $t3 = $t2 + $t3
    
    j	 loop1				   # jump to loop1

loop2:
    bgt	 $t3, $t1, end
    move $a0, $t3
    li   $v0, 1
    syscall

    li   $a0, '\n'             #   printf("%c", '\n');
    li   $v0, 11
    syscall

    add	 $t3, $t2, $t3		   # $t3 = $t2 + $t3
    
    j	 loop2				   # jump to loop2
    
end:
    li   $v0, 0                # return 0
    jr   $ra
                
                .data
string0:
    .asciiz "Enter the starting number: "
string1:
    .asciiz "Enter the stopping number: "
string2:
    .asciiz "Enter the step size: "