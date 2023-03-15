main :
    la $a0, string 
    li $v0, 4       # printf %s
    syscall
    li  $v0, 0      # return 0
    jr  $ra

    .data
string:
    .asciiz "Well, this was a MIPStake!\n"