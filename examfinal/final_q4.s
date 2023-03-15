# return the number of peaks in an array of integers
#
# A peak is a value that is both preceded and succeeded
# by a value smaller than itself
#
# ie:
# Both the value before and the value after the current value
# are smaller than the current value
#
# eg:
# [1, 3, 2, 5, 4, 4, 9, 0, 1, -9, -5, -7]
#     ^     ^        ^     ^       ^
# The value 3, 5, 9, 1, -5 are all peaks in this array
# So your function should return 5

.text
.globl final_q4

final_q4:
	# YOU DO NOT NEED TO CHANGE THE LINES ABOVE HERE


	# REPLACE THIS LINE WITH YOUR CODE
	move	$t0, $a0	# array
	move	$t1, $a1	# length
	li      $t2, 0		# total
	li      $t3, 0		# i
	
	sub		$t1, $t1, 1			# $t1 = $t1 - 1
loop0:
	bge		$t3, $t1, end0		# if $t3 >= $t1 then end0

	mul		$t4, $t3, 4			# $t4 = $t3 * 4
	add		$t5, $t4, $t0		# $t5 = $t0 + $t4
	lw		$t6, ($t5)			# $t6 = *($t5)

	sub		$t4, $t4, 4			# $t4 = $t4 - 4
	add		$t5, $t4, $t0		# $t5 = $t0 + $t4
	lw		$t7, ($t5)			# $t7 = *($t5)

	ble		$t6, $t7, next0		# if $t6 <= $t7 then next0

	add		$t4, $t4, 8			# $t4 = $t4 + 8
	add		$t5, $t4, $t0		# $t5 = $t0 + $t4
	lw		$t8, ($t5)			# $t8 = *($t5)

	ble		$t6, $t8, next0	# if $t6 <= $t5 then next0
	addi    $t2, $t2, 1			# $t2 = $t2 + 1

next0:
	addi	$t3, $t3, 1			# $t3 = $t3 + 1
	j		loop0
end0:
	move	$v0, $t2

	jr	$ra


# ADD ANY EXTRA FUNCTIONS BELOW THIS LINE
