# Read 10 numbers into an array
# print 0 if they are in non-decreasing order
# print 1 otherwise

# i in register $t0

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
    li   $t0, 1         # i = 1
    li   $t6, 0         # swapped = 0
loop1:
    bge  $t0, 10, end1  # while (i < 10) {

    mul  $t1, $t0, 4    #   calculate &numbers[i]
    la   $t2, numbers   #
    add  $t3, $t1, $t2  #
    lw   $t4, ($t3)     #   load numbers[i] into $t4
    sub	 $t3, $t3, 4	#   $t3 = $t3 - 4
    lw   $t5, ($t3)     #   load numbers[i-1] into $t5

    bge	 $t4, $t5, next	#   if $t4 >= $t5 then next
    li   $t6, 1

    j    next

next:
    addi $t0, $t0, 1    #   i++
    j    loop1          # }

end1:
    move $a0, $t6       #   load swapped into $a0
    li   $v0, 1         #   printf("%d", swapped)
    syscall

    li   $a0, '\n'      #   printf("%c", '\n');
    li   $v0, 11
    syscall

    jr   $ra

.data

numbers:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  # int numbers[10] = {0};
