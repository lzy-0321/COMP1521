main:
    la   $a0, string0    # printf("Enter a mark: ");
    li   $v0, 4
    syscall

    li   $v0, 5          # scanf("%d", x);
    syscall
    
    move $t0, $v0		 # $t0 = v01
    bge	 $t0,  50, check1	# if $t0 > 50 check1
    la   $a0, string1    # printf("FL\n");
    li   $v0, 4
    syscall

    b    end

check1:
    bge	 $t0,  65, check2	# if $t0 > 65 check2
    la   $a0, string2    # printf("PS\n");
    li   $v0, 4
    syscall

    b    end

check2:
    bge	 $t0,  75, check3	# if $t0 > 75 check3
    la   $a0, string3    # printf("CR\n");
    li   $v0, 4
    syscall

    b    end

check3:
    bge	 $t0,  85, check4	# if $t0 > 85 check4
    la   $a0, string4    # printf("DN\n");
    li   $v0, 4
    syscall

    b    end

check4:
    la   $a0, string5    # printf("HD\n");
    li   $v0, 4
    syscall

end:
    li   $v0, 0          # return 0
    jr   $ra

        .data
string0:
    .asciiz "Enter a mark: "
string1:
    .asciiz "FL\n"
string2:
    .asciiz "PS\n"
string3:
    .asciiz "CR\n"
string4:
    .asciiz "DN\n"
string5:
    .asciiz "HD\n"