#
# COMP1521 lab exercise sample solution
#
# A simple MIPS program that calculates the Gaussian sum between two numbers
# Written 12/2/2022
# by Dylan Brotherston (d.brotherston@unsw.edu.au)

# int main(void)
# {
#   int number1, number2;
#
#   printf("Enter first number: ");
#   scanf("%d", &number1);
#
#   printf("Enter second number: ");
#   scanf("%d", &number2);
#
#   int gaussian_sum = ((number2 - number1 + 1) * (number1 + number2)) / 2;
#
#   printf("The sum of all numbers between %d and %d (inclusive) is: %d\n", number1, number2, gaussian_sum);
#
#   return 0;
# }

main:

  #
  # TODO: add your code HERE
  #
  li   $t0, 0
  li   $t1, 0
  li   $t2, 0

  la   $a0, prompt1    # printf("Enter first number: ");
  li   $v0, 4
  syscall
  
  li   $v0, 5          # scanf("%d", x);
  syscall

  move $t0, $v0

  la   $a0, prompt2    # printf("Enter second number: ");
  li   $v0, 4
  syscall

  li   $v0, 5          # scanf("%d", x);
  syscall

  move $t1, $v0
  
  la   $a0, answer1    #"The sum of all numbers between "
  li   $v0, 4
  syscall
  
  move $a0, $t0
  li   $v0, 1
  syscall        

  la $a0, answer2
  li   $v0, 4
  syscall

  move $a0, $t1
  li   $v0, 1
  syscall

  la $a0, answer3
  li   $v0, 4
  syscall

  sub $t2, $t1, $t0 #t2 = number2 - number1
  addi $t2, $t2, 1  #t2 = number2 - number1 + 1
  add $t1, $t1, $t0 #t1 = t1 + t2
  mul $t2, $t2, $t1 #(number2 - number1 + 1) * (number1 + number2)
  div $t2, $t2, 2   #((number2 - number1 + 1) * (number1 + number2)) / 2

  move $a0, $t2
  li   $v0, 1
  syscall

  li   $a0, '\n'             #   printf("%c", '\n');
  li   $v0, 11
  syscall
  
  li   $v0, 0
  jr   $ra          # return

  
.data
  prompt1: .asciiz "Enter first number: "
  prompt2: .asciiz "Enter second number: "

  answer1: .asciiz "The sum of all numbers between "
  answer2: .asciiz " and "
  answer3: .asciiz " (inclusive) is: "
