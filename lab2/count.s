main:
    li    $t0, 1         #int i = 1
    li    $t1, 0         #int number
    
    la   $a0, string0    # printf("Enter a number: ");
    li   $v0, 4
    syscall

    li   $v0, 5          # scanf("%d", number);
    syscall

    move $t1, $v0
loop:
    bgt		$t0, $t1, end	# if $t0 > $t1 then end
    move    $a0, $t0
    li      $v0, 1
    syscall

    li   $a0, '\n'    #   printf("%c", '\n');
    li   $v0, 11
    syscall

    addi	$t0, $t0, 1		# $t0 = $t0 + 1
    
    b		loop			# branch to loop
    
end:
    li   $v0, 0          # return 0
    jr   $ra
            .data
string0:
    .asciiz "Enter a number: "