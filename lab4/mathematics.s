.data
    prompt_str: .asciiz "Enter a random seed: "
    result_str: .asciiz "The random result is: "

.text
main:
    #  ADD CODE TO CREATE STACK FRAME
    la    $t0, random_seed
    la    $a0, prompt_str   # printf("Enter a random seed: ");
    li    $v0, 4
    syscall

    li    $v0, 5          # scanf("%d", number);
    syscall

    move  $t0, $v0


    # ADD CODE FORFUNCTION HERE
    begin               # move frame pointer
    push  $ra           # save $ra onto stack

    move  $a0, $t0
    jal   seed_rand     # seed_rand(random_seed);
    
    li    $t1, 100
    move  $a0, $t1
    jal   rand

    move  $t1, $v0

    move  $a0, $t1      
    jal   add_rand

    move  $a0, $v0
    jal   sub_rand

    move  $a0, $v0
    jal   seq_rand

    move  $t2, $v0

    la    $a0, result_str   # printf("Enter a random seed: ");
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

    jr    $ra

add_rand:
    begin                # move frame pointer
    push  $ra            # save $ra onto stack
    push  $a0            # save $a0 onto stack

    li    $a0, 65535
    jal   rand

    pop   $a0            # recover $a0 from stack

    add   $v0, $v0, $a0
    
    pop   $ra            # recover $ra from stack
    end                  # move frame pointer back

    jr    $ra            # return from sum_product

sub_rand:
    begin                # move frame pointer
    push  $ra            # save $ra onto stack

    jal   rand

    sub   $v0, $a0, $v0
    
    pop   $ra            # recover $ra from stack
    end                  # move frame pointer back

    jr    $ra            # return from sum_product

seq_rand:
    begin                # move frame pointer
    push  $ra            # save $ra onto stack
    push  $a0            # save $a0 onto stack

    li    $a0, 100
    jal   rand
    
    pop   $a0            # recover $a0 from stack
    
    move  $t8, $v0       # int limit = rand(100);
    li    $t7, 0         # int i = 0
loop0:

    bge	  $t7, $t8, end	# if $t1 >= $t0 then end

    jal   add_rand

    move  $a0, $v0
    addi  $t7, $t7, 1	 # $t1 = $t1 + 1
    j	  loop0			 # jump to loop0
    
end:
    pop   $ra            # recover $ra from stack
    end                  # move frame pointer back

    jr    $ra            # return from sum_product


##
## The following are two utility functions, provided for you.
##
## You don't need to modify any of the following.
## But you may find it useful to read through.
## You'll be calling these functions from your code.
##

OFFLINE_SEED = 0x7F10FB5B

########################################################################
# .DATA
.data

# int random_seed;
.align 2
random_seed:    .space 4


########################################################################
# .TEXT <seed_rand>
.text

# DO NOT CHANGE THIS FUNCTION

seed_rand:
    # Args:
    #   - $a0: unsigned int seed
    # Returns: void
    #
    # Frame:    []
    # Uses:     [$a0, $t0]
    # Clobbers: [$t0]
    #
    # Locals:
    # - $t0: offline_seed
    #
    # Structure:
    #   seed_rand

    li  $t0, OFFLINE_SEED # const unsigned int offline_seed = OFFLINE_SEED;
    xor $t0, $a0          # random_seed = seed ^ offline_seed;
    sw  $t0, random_seed

    jr  $ra               # return;

########################################################################
# .TEXT <rand>
.text

# DO NOT CHANGE THIS FUNCTION

rand:
    # Args:
    #   - $a0: unsigned int n
    # Returns:
    #   - $v0: int
    #
    # Frame:    []
    # Uses:     [$a0, $v0, $t0]
    # Clobbers: [$v0, $t0]
    #
    # Locals:
    #   - $t0: random_seed
    #
    # Structure:
    #   rand

    lw      $t0, random_seed # unsigned int rand = random_seed;
    multu   $t0, 0x5bd1e995  # rand *= 0x5bd1e995;
    mflo    $t0
    addiu   $t0, 12345       # rand += 12345;
    sw      $t0, random_seed # random_seed = rand;

    remu    $v0, $t0, $a0    #    rand % n
    jr      $ra              # return rand % n;