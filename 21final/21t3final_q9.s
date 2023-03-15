# this code reads a line of input and prints 42
# change it to check the string for brackets

# read a line of input and checks whether it consists only of balanced brackets
# if the line contains characters other than ()[]{} -1 is printed
# if brackets are not balance,  -1 is printed
# if the line contains only balanced brackets, length of the line is printed

main:
    la   $a0, line
    la   $a1, 1024
    li   $v0, 8          # fgets(line, 1024, stdin);
    syscall


    # THESE LINES JUST PRINT 42
    # REPLACE THE LINES BELOW WITH YOUR CODE
    li  $a0, 0
    li  $a1, '\n'
    jal check

    move $a0, $v0
    li $v0, 1
    syscall
    li   $a0, '\n'
    li   $v0, 11
    syscall
    # REPLACE THE LINES ABOVE WITH YOUR CODE


    li   $v0, 0          # return 0
    jr   $31


# PUT YOU FUNCTION DEFINITIONS HERE


.data
line:
    .byte 0:1024

check:
    begin                # move frame pointer
    push  $ra            # save $ra onto stack
    beq	  $a0, $a1, next0	# if $a0 == $a1 then next0
    push  $a1
    jal   match
    move  $a0, $v0
    pop   $a1
    ble	  $a0, 0, end0	# if $a0 <= 0 then end0

    jal   check
    
next0:
    addi  $a0, $a0, 1			# $a0 = $a0 + 1
    j end0

end0:
    pop   $ra            # recover $ra from stack
    end
    jr  $ra

match:
    begin                # move frame pointer
    push  $ra            # save $ra onto stack

    li    $t0, -1           # r = -1
    move  $t1, $a0
    la    $t2, line
    add   $t3, $t1, $t2
    sw    $t4, ($t3)        # c = line[index]
    li    $t5, 0            # w = 0
    
