.text
main:
    la    $a0, prompt_m
    li    $v0, 4
    syscall

    li    $v0, 5
    syscall            # scanf("%d", &n)
    move  $t0, $v0     # m = $t0

    la    $a0, prompt_n
    li    $v0, 4
    syscall
    
    li    $v0, 5
    syscall            # scanf("%d", &n)
    move  $t1, $v0     # n = $t1

    begin
    push  $ra           # save $ra onto stack
    
    move  $a0, $t0
    move  $a1, $t1
    # ADD CODE FORFUNCTION HERE
    jal   ackermann

    move  $t2, $v0

    la    $a0, msg1
    li    $v0, 4
    syscall

    move  $a0, $t0
    li    $v0, 1
    syscall

    la    $a0, msg2
    li    $v0, 4
    syscall

    move  $a0, $t1
    li    $v0, 1
    syscall

    la    $a0, msg3
    li    $v0, 4
    syscall

    move  $a0, $t2
    li    $v0, 1
    syscall

    li   $a0, '\n'       # printf("%c", '\n');
    li   $v0, 11
    syscall            

    # ADD CODE TO REMOVE STACK FRAME
    pop   $ra            # recover $ra from stack
    end                  # move frame pointer back

    jr $ra


.data
    prompt_m:    .asciiz "Enter m: "
    prompt_n:    .asciiz "Enter n: "
    msg1:        .asciiz "Ackermann("
    msg2:        .asciiz ", "
    msg3:        .asciiz ") = "


.text
ackermann:
    # ADD CODE TO CREATE STACK FRAME
    begin                # move frame pointer
    push  $ra            # save $ra onto stack
    # ADD CODE FORFUNCTION HERE
    beq   $a0, 0, end0
    beq   $a1, 0, end1
    j	  end2		     # jump to end2
    
end0:
    addi  $v0, $a1, 1
    j	  end			# jump to end

end1:


    sub   $a0 ,$a0, 1
    li    $a1, 1
    jal   ackermann

    j     end
end2:
    
    sub   $a1 ,$a1, 1
    jal   ackermann

    move  $a1, $v0
    sub   $a0 ,$a0, 1
    jal   ackermann
    j     end
    # ADD CODE TO REMOVE STACK FRAME
end:
    pop   $ra            # recover $ra from stack
    end
    jr  $ra
