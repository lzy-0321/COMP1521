# read a line and print whether it is a palindrom

main:
    la   $a0, str0       # printf("Enter a line of input: ");
    li   $v0, 4
    syscall

    la   $a0, line
    la   $a1, 256
    li   $v0, 8          # fgets(buffer, 256, stdin)
    syscall              #

    li   $t0, 0          # i = 0
loop0:
    la   $t1, line
    add  $t2, $t0, $t1
    lb   $t3, ($t2)
    beq	 $t3, 0, end0	# if line[i] == 0 then target
    
    addi $t0, $t0, 1
    j    loop0

end0:

    li   $t4, 0          # j = 0
    sub  $t5, $t0, 2     # k = i - 2

loop1:
    bge	 $t4, $t5, end1	 # if $t1 >= $t3 then end1
    la   $t1, line
    add  $t2, $t4, $t1
    lb   $t3, ($t2)      # $t3 = line[j]
    add  $t6, $t5, $t1
    lb   $t7, ($t6)      # $t7 = line[k]

    beq  $t3, $t7, next
    la   $a0, not_palindrome
    li   $v0, 4
    syscall

    j    end2

next:

    addi $t4, $t4, 1
    sub  $t5, $t5, 1
    j    loop1

end1:

    la   $a0, palindrome
    li   $v0, 4
    syscall

end2:

    li   $v0, 0          # return 0
    jr   $ra


.data
str0:
    .asciiz "Enter a line of input: "
palindrome:
    .asciiz "palindrome\n"
not_palindrome:
    .asciiz "not palindrome\n"


# line of input stored here
line:
    .space 256

