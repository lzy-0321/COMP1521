# read 10 numbers into an array
# swap any pairs of of number which are out of order
# then print the 10 numbers

# i in register $t0,
# registers $t1 - $t3 used to hold temporary results

main:

    li   $t0, 0         # i = 0
loop0:
    bge  $t0, 10, end0  # while (i < 10) {

    li   $v0, 5         #   scanf("%d", &numbers[i]);
    syscall             #

    mul  $t1, $t0, 4    #   calculate &numbers[i]
    la   $t2, numbers   #
    add  $t3, $t1, $t2  #
    sw   $v0, ($t3)     #   store entered number in array

    addi $t0, $t0, 1    #   i++;
    j    loop0          # }
end0:


    # PUT YOUR CODE HERE

    li   $t6, 1         #int swapped = 1;
loop1:
    bne	 $t6, 1, end1	# if $t4 != 1 then end1
    li   $t0, 1         # i = 0
    li   $t6, 0
loop2:
    bge  $t0, 10, end2  # while (i < 10) {

    mul  $t1, $t0, 4    #   calculate &numbers[i]
    la   $t2, numbers   #
    add  $t3, $t1, $t2  #
    lw   $t4, ($t3)     #   load numbers[i] into $t4
    sub	 $t3, $t3, 4	#   $t3 = $t3 - 4
    lw   $t5, ($t3)     #   load numbers[i-1] into $t5
    
    bge	 $t4, $t5, next	#   if $t4 >= $t5 then next
    sw   $t4, ($t3)
    add  $t3, $t3, 4
    sw   $t5, ($t3)
    li   $t6, 1

    j    next

next:
    addi $t0, $t0, 1    #   i++
    j    loop2          # }
end2:
    j    loop1
end1:

    li   $t0, 0         # i = 0
loop3:
    bge  $t0, 10, end3
    mul  $t1, $t0, 4    #   calculate &numbers[i]
    la   $t2, numbers   #
    add  $t3, $t1, $t2  #
    lw   $a0, ($t3)     #   load numbers[i] into $t4
    li   $v0, 1         #   printf("%d", numbers[i])
    syscall

    li   $a0, '\n'      #   printf("%c", '\n');
    li   $v0, 11
    syscall

    addi $t0, $t0, 1    #   i++
    b    loop3          # }

end3:
    li   $v0, 0
    jr   $ra            # return 0

.data

numbers:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  # int numbers[10] = {0};
