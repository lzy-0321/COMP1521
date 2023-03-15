# Read a number n and print the first n tetrahedral numbers
# https://en.wikipedia.org/wiki/Tetrahedral_number

main:                  # int main(void) {

    li   $t0, 0        # int i
    li   $t1, 1        # int j = 1
    li   $t2, 1        # int n = 1 
    li   $t3, 0        # int total = 0
    li   $t4, 0        # int how_many

    la   $a0, prompt   # printf("Enter how many: ");
    li   $v0, 4
    syscall

    li   $v0, 5         # scanf("%d", number);
    syscall

    move $t4, $v0       #move number to how_many

loop1:
    bgt	 $t2, $t4, end	# if $t2 > $t4 then end
    move $t3, $0
    move $t1, $1

loop2:
    bgt	 $t1, $t2, next1# if $t1 > $t2 then next1
    move $t0, $1	        # $t0 = 1

loop3:
    bgt  $t0, $t1, next2
    add  $t3, $t3, $t0
    addi $t0, $t0, 1
    j	 loop3			# jump to loop3

next2:
    addi $t1, $t1, 1	# $t1 = $t1 + 1
    j    loop2

next1:
    move $a0, $t3        #   printf("%d", total);
    li   $v0, 1
    syscall

    li   $a0, '\n'      # printf("%c", '\n');
    li   $v0, 11
    syscall

    addi $t2, $t2, 1	# $t2 = $t2 + 1
    j	 loop1			# jump to loop1
    

end:
    li   $v0, 0
    jr   $ra           # return 0

.data
    prompt: .asciiz "Enter how many: "
