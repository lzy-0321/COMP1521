########################################################################
# COMP1521 22T1 -- Assignment 1 -- Mipstermind!
#
#
# !!! IMPORTANT !!!
# Before starting work on the assignment, make sure you set your tab-width to 8!
# It is also suggested to indent with tabs only.
# Instructions to configure your text editor can be found here:
#   https://cgi.cse.unsw.edu.au/~cs1521/22T1/resources/mips-editors.html
# !!! IMPORTANT !!!
#
#
# This program was written by YOUR-NAME-HERE (z5555555)
# on INSERT-DATE-HERE
#
# Version 1.0 (28-02-22): Team COMP1521 <cs1521@cse.unsw.edu.au>
#
########################################################################

#![tabsize(8)]

# Constant definitions.
# DO NOT CHANGE THESE DEFINITIONS

TURN_NORMAL = 0
TURN_WIN    = 1
NULL_GUESS  = -1


########################################################################
# .DATA
# YOU DO NOT NEED TO CHANGE THE DATA SECTION
.data

# int correct_solution[GUESS_LEN];
.align 2
correct_solution:	.space GUESS_LEN * 4

# int current_guess[GUESS_LEN];
.align 2
current_guess:		.space GUESS_LEN * 4

# int solution_temp[GUESS_LEN];
.align 2
solution_temp:		.space GUESS_LEN * 4


guess_length_str:	.asciiz "Guess length:\t"
valid_guesses_str:	.asciiz "Valid guesses:\t1-"
number_turns_str:	.asciiz "How many turns:\t"
enter_seed_str:		.asciiz "Enter a random seed: "
you_lost_str:		.asciiz "You lost! The secret codeword was: "
turn_str_1:		.asciiz "---[ Turn "
turn_str_2:		.asciiz " ]---\n"
enter_guess_str:	.asciiz "Enter your guess: "
you_win_str:		.asciiz "You win, congratulations!\n"
correct_place_str:	.asciiz "Correct guesses in correct place:   "
incorrect_place_str:	.asciiz "Correct guesses in incorrect place: "

############################################################
####                                                    ####
####   Your journey begins here, intrepid adventurer!   ####
####                                                    ####
############################################################


########################################################################
#
# Implement the following 8 functions,
# and check these boxes as you finish implementing each function
#
#  - [ ] main
#  - [ ] play_game
#  - [ ] generate_solution
#  - [ ] play_turn
#  - [ ] read_guess
#  - [ ] copy_solution_into_temp
#  - [ ] calculate_correct_place
#  - [ ] calculate_incorrect_place
#  - [X] seed_rand  (provided for you)
#  - [X] rand       (provided for you)
#
########################################################################


########################################################################
# .TEXT <main>
.text
main:
	# Args:     void
	# Returns:
	#   - $v0: int
	#
	# Frame:    [$ra, ...]
	# Uses:     [$v0, $a0, ...]
	# Clobbers: [$v0, $a0, ...]
	#
	# Locals:
	#   - [...]
	#
	# Structure:
	#   main
	#   -> [prologue]
	#   -> body
	#   -> [epilogue]

main__prologue:
	begin                   # begin a new stack frame
	push	$ra             # | $ra

main__body:
	# printf("Guess length: %d\n", GUESS_LEN);
	li	$v0, 4          # syscall 4: print_string
	la	$a0, guess_length_str
	syscall                 # printf("Guess length: ");

	li	$v0, 1          # syscall 1: print_int
	li	$a0, GUESS_LEN
	syscall                 # printf("%d", GUESS_LEN);

	li	$v0, 11         # syscall 11: print_char
	li	$a0, '\n'
	syscall                 # printf("\n");


	# printf("Valid guesses: 1-%d\n", GUESS_CHOICES);
	li	$v0, 4          # syscall 4: print_string
	la	$a0, valid_guesses_str
	syscall                 # printf("Valid guesses: 1-");

	li	$v0, 1          # syscall 1: print_int
	li	$a0, GUESS_CHOICES
	syscall                 # printf("%d", GUESS_CHOICES);

	li	$v0, 11         # syscall 11: print_char
	li	$a0, '\n'
	syscall                 # printf("\n");


	# printf("How many turns: %d\n\n", MAX_TURNS);
	li	$v0, 4          # syscall 4: print_string
	la	$a0, number_turns_str
	syscall                 # printf("How many turns: ");

	li	$v0, 1          # syscall 1: print_int
	li	$a0, MAX_TURNS
	syscall                 # printf("%d", MAX_TURNS);

	li	$v0, 11         # syscall 11: print_char
	li	$a0, '\n'
	syscall                 # printf("\n");
	syscall                 # printf("\n");


	# TODO ... complete this function
	li  $a0, enter_seed_str
	li  $v0, 4
	syscall

	li   $v0, 5          # scanf("%d", number);
    syscall

	move $a0, $v0

	jal  seed_rand

	jal  play_game

main__epilogue:
	pop	$ra             # | $ra
	end                     # ends the current stack frame

	li	$v0, 0
	jr	$ra             # return 0;




########################################################################
# .TEXT <play_game>
.text
play_game:
	# Args:     void
	# Returns:  void
	#
	# Frame:    [...]
	# Uses:     [...]
	# Clobbers: [...]
	#
	# Locals:
	#   - [...]
	#
	# Structure:
	#   play_game
	#   -> [prologue]
	#   -> body
	#   -> [epilogue]

play_game__prologue:
    pop   $ra            # recover $ra from stack
play_game__body:

	# TODO ... complete this function
	jal   generate_solution

	li   $t0, 0          # turn = 0, t0 = turn

loop0:

	bge	 $t0, MAX_TURNS, pgbend0	# turn >= MAX_TURNS go next

	move $a0, $t0
	jal  play_turn		# int turn_status = play_turn(turn);

	beq	 $v0, TURN_WIN, pgbend	# if $v0 == turn_win then end
	
	addi $t0, $t0, 1	# turn++
	j    loop0
	
pgbend0:

	li  $a0, you_lost_str
	li  $v0, 4
	syscall

	li  $t1, 0    		# i = 0, t1 = i

loop1:

	bge	$t1, GUESS_LEN, pgbnext1
	
	la  $t3, correct_solution   #
    add $t4, $t3, $t1
	lb  $a0, ($t4)
	li  $v0, 11
	syscall

	addi $t1, $t1, 1 #i++
	j    loop1

pgbnext1:

	li	$a0, '\n'
	li	$v0, 11         # syscall 11: print_char
	syscall

pgbend:
    pop   $ra            # recover $ra from stack
play_game__epilogue:
	jr	$ra             # return;




########################################################################
# .TEXT <generate_solution>
.text
generate_solution:
	# Args:     void
	# Returns:  void
	#
	# Frame:    [...]
	# Uses:     [...]
	# Clobbers: [...]
	#
	# Locals:
	#   - [...]
	#
	# Structure:
	#   generate_solution
	#   -> [prologue]
	#   -> body
	#   -> [epilogue]

generate_solution__prologue:
	push  $ra            # save $ra onto stack
generate_solution__body:

	# TODO ... complete this function
	li   $t1, 0 				# int i = 0
loop2:
	bge	 $t1, GUESS_LEN, gsbnext2	# if $t0 >= GUESS_LEN then next0
	
	la   $t3, correct_solution   #
    add  $t4, $t3, $t1

	li   $a0, GUESS_CHOICES
	jal  rand			# rand(GUESS_CHOICES) = v0
	addi $v0, $v0, 1	# rand(GUESS_CHOICES) + 1 = v0

	sb	 $v0, ($t4)		# correct_solution[i] = rand(GUESS_CHOICES) + 1
	
	addi $t1, $t1, 1    # i++
	j    loop2

gsbnext2:
generate_solution__epilogue:
	pop   $ra            # recover $ra from stack
	jr	$ra             # return;




########################################################################
# .TEXT <play_turn>
.text
play_turn:
	# Args:
	#   - $a0: int
	# Returns:
	#   - $v0: int
	#
	# Frame:    [...]
	# Uses:     [...]
	# Clobbers: [...]
	#
	# Locals:
    #   - [...]
	#
	# Structure:
	#   play_turn
	#   -> [prologue]
	#   -> body
	#   -> [epilogue]

play_turn__prologue:
play_turn__body:

	# TODO ... complete this function
	move $t0, $a0

	li	$a0, turn_str_1
	li	$v0, 4          
	syscall             

	addi $t0, $t0, 1
	move $a0, $t0
	li   $v0, 1
	syscall

	li	$a0, turn_str_2
	li	$v0, 4          
	syscall

	li	$a0, '\n'
	li	$v0, 11         # syscall 11: print_char
	syscall                 # printf("\n");

	li	$a0, enter_guess_str
	li	$v0, 4          
	syscall

	jal  read_guess

	jal  copy_solution_into_temp

	jal  calculate_correct_place
	move $t0, $v0

	jal calculate_incorrect_place
	move $t1, $v0

	beq	 $t0, GUESS_LEN, plnext0	# if $t0 == GUESS_LEN then nest
	
	li	$a0, correct_place_str
	li	$v0, 4          # syscall 1: print_int
	syscall
	move $a0, $t0
	li   $v0, 1
	syscall

	li	$a0, '\n'
	li	$v0, 11         # syscall 11: print_char
	syscall                 # printf("\n");

	li	$a0, incorrect_place_str
	li	$v0, 4          # syscall 1: print_int
	syscall

	move $a0, $t1
	li   $v0, 1
	syscall
	
	li	$a0, '\n'
	li	$v0, 11         # syscall 11: print_char
	syscall                 # printf("\n");

	li $v0, TURN_NORMAL
	j    plend

plnext0:

	li	$a0, you_win_str
	li	$v0, 4          # syscall 1: print_int
	syscall

	li	$a0, '\n'
	li	$v0, 11         # syscall 11: print_char
	syscall                 # printf("\n");

	li $v0, TURN_WIN
	j    plend

plend:
play_turn__epilogue:
	jr	$ra             # return;




########################################################################
# .TEXT <read_guess>
.text
read_guess:
	# Args:     void
	# Returns:  void
	#
	# Frame:    [...]
	# Uses:     [...]
	# Clobbers: [...]
	#
	# Locals:
	#   - [...]
	#
	# Structure:
	#   read_guess
	#   -> [prologue]
	#   -> body
	#   -> [epilogue]

read_guess__prologue:
read_guess__body:

	# TODO ... complete this function
	li  $t0, 0			# t0 = n_guess
loop3:
	bge	$t0, GUESS_LEN, rgend	# if $t0 >= GUESS_LEN then end
	
	li  $v0, 5
	syscall
	move $t1, $v0		# t1 = guess

	la  $t3, current_guess  #
    add $t4, $t3, $t0

	sb	$t1, ($t4)		# current_guess[n_guess] = guess;

	addi $t0, $t0, 1

	j    loop3
rgend:
read_guess__epilogue:
	jr	$ra             # return;




########################################################################
# .TEXT <copy_solution_into_temp>
.text
copy_solution_into_temp:
	# Args:     void
	# Returns:  void
	#
	# Frame:    [...]
	# Uses:     [...]
	# Clobbers: [...]
	#
	# Locals:
	#   - [...]
	#
	# Structure:
	#   copy_solution_into_temp
	#   -> [prologue]
	#   -> body
	#   -> [epilogue]

copy_solution_into_temp__prologue:
copy_solution_into_temp__body:
	# TODO ... complete this function
	li  $t0, 0		# i = 0
loop4:
	bge	$t0, GUESS_LEN, csitend0	# if $t0 >= GUESS_LEN then end0
	
	la  $t2, current_guess  #
    add $t3, $t2, $t0

	lb	$t5, ($t3)		# t5 = current_guess[i]

	la  $t4, solution_temp  #
    add $t6, $t4, $t0

	sb  $t5, ($t6)		# solution_temp[i] = current_guess[i]
	
	addi $t0, $t0, 1
	j   loop4

csitend0:
copy_solution_into_temp__epilogue:
	jr	$ra             # return;




########################################################################
# .TEXT <calculate_correct_place>
.text
calculate_correct_place:
	# Args:     void
	# Returns:
	#   - $v0: int
	## Frame:    [...]
	# Uses:     [...]
	# Clobbers: [...]
	#
	# Locals:
	#   - [...]
	#
	# Structure:
	#   calculate_correct_place
	#   -> [prologue]
	#   -> body
	#   -> [epilogue]

calculate_correct_place__prologue:
calculate_correct_place__body:

	# TODO ... complete this function
	li  $t0, 0		# int total = 0
	li  $t1, 0		# int guess_index = 0
loop5:
	bge	$t1, GUESS_LEN, ccpend0	# if $t1 >= GUESS_LEN then target
	
	la  $t3, current_guess  #
    add $t4, $t3, $t1

	lb	$t5, ($t4)		# int guess = current_guess[guess_index]

	la  $t3, solution_temp  #
    add $t6, $t3, $t1

	lb  $t7, ($t6)		# solution_temp[guess_index]

	bne	$t7, $t5, ccpnext0	# if $t6 != $t5 then next0
	addi $t0, $t0, 1
	li  $t8, NULL_GUESS
	sw  $t8, ($t4)
	sw  $t8, ($t6)
ccpnext0:

	addi $t1, $t1, 1
	j    loop5

ccpend0:
	move $v0, $t0

calculate_correct_place__epilogue:
	jr	$ra             # return;




########################################################################
# .TEXT <calculate_incorrect_place>
.text
calculate_incorrect_place:
	# Args:     void
	# Returns:
	#   - $v0: int
	#
	# Frame:    [...]
	# Uses:     [...]
	# Clobbers: [...]
	#
	# Locals:
	#   - [...]
	#
	# Structure:
	#   calculate_incorrect_place
	#   -> [prologue]
	#   -> body
	#   -> [epilogue]

calculate_incorrect_place__prologue:
calculate_incorrect_place__body:

	# TODO ... complete this function
	li  $t0, 0		# int total = 0
	li  $t1, 0		# int guess_index = 0
loop6:
	bge	$t1, GUESS_LEN, cipend0	# if $t1 >= GUESS_LEN then target
	
	la  $t3, current_guess  #
    add $t4, $t3, $t1

	lb	$t5, ($t4)		# int guess = current_guess[guess_index]

	beq	$t5, NULL_GUESS, cipnext0	# if $t5 == NULL_GUESS then target
	li  $t2, 0		# int solution_index = 0
loop7:
	bge	$t2, GUESS_LEN, cipend1	# if $t2 >= GUESS_LEN then end1
	
	la  $t3, solution_temp  #
    add $t4, $t3, $t2

	lb  $t6, ($t4)

	bne	$t6, $t5, cipnext1	# if $t6 != $t5 then next1
	addi $t0, $t0, 1
	li  $t8, NULL_GUESS
	sw  $t8, ($t4)

	j   cipend1
cipnext1:
	addi $t2, $t2, 1
	j    loop7
cipend1:

cipnext0:
	addi $t1, $t1, 1		# guess_index++
	j    loop6
cipend0:
	move $v0, $t0
calculate_incorrect_place__epilogue:
	jr	$ra             # return;




########################################################################
####                                                                ####
####        STOP HERE ... YOU HAVE COMPLETED THE ASSIGNMENT!        ####
####                                                                ####
########################################################################

##
## The following are two utility functions, provided for you.
##
## You don't need to modify any of the following.
## But you may find it useful to read through.
## You'll be calling these functions from your code.
##


########################################################################
# .DATA
# DO NOT CHANGE THIS DATA SECTION
.data

# int random_seed;
.align 2
random_seed:		.space 4


########################################################################
# .TEXT <seed_rand>
# DO NOT CHANGE THIS FUNCTION
.text
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

	li	$t0, OFFLINE_SEED # const unsigned int offline_seed = OFFLINE_SEED;
	xor	$t0, $a0          # random_seed = seed ^ offline_seed;
	sw	$t0, random_seed

	jr	$ra               # return;




########################################################################
# .TEXT <rand>
# DO NOT CHANGE THIS FUNCTION
.text
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
	# - $t0: random_seed
	#
	# Structure:
	#   rand

	lw	$t0, random_seed  # unsigned int rand = random_seed;
	multu	$t0, 0x5bd1e995   # rand *= 0x5bd1e995;
	mflo	$t0
	addiu	$t0, 12345        # rand += 12345;
	sw	$t0, random_seed  # random_seed = rand;

	remu	$v0, $t0, $a0     # rand % n
	jr	$ra               # return;