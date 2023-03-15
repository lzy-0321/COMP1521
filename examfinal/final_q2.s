# given one integer value return the right justified version of the value.
# right-justification is (in this case)
# the process of removing all zeros from the right side of the value
# eg:
# given  (in $a0) 0b00000000000000000000000001101000
# return (in $v0) 0b00000000000000000000000000001101

.text
.globl final_q2

final_q2:
    # YOU DO NOT NEED TO CHANGE THE LINES ABOVE HERE
    

    # REPLACE THIS LINE WITH YOUR CODE
    li      $t0, 0
    li      $t1, 0
loop0:
    bge		$t0, 32, end0	# if $t0 >= 32 then end0;
    
    sllv		$t2, 1, $t0		# $t2 = 1 << $t0
    and		$t2, $a0, $t2	# $t2 = $a0 & $t2
    bne		$t2, 0, end0	# if $t2 != 0 then end0
    addi    $t0, $t0, 1
    addi    $t1, $t1, 1
    j       loop0

end0:
    srlv		$a0, $a0, $t1			# $a0 = $a0 >> $t1
    
    move    $v0, $a0    # return argument unchanged


    jr  $ra


# ADD ANY EXTRA FUNCTIONS BELOW THIS LINE
