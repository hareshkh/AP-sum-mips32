## -----------------------------------------------------------------------
## Group ID - 61 (15114031_15114032) - Haresh Khanna & Harjot Singh Oberai
## Date : 02/11/2016
## AP_Sum.asm - Calculates the sum of a Arithematic Progression
## -----------------------------------------------------------------------
##	Register 	Function
##	$t1			First term input and then stores n-th term in each iteration
##	$t2			Common difference
##	$t3			Number of terms
##	$t4			Loop register
##	$t5			Answer register

.data
	prompt1:	.asciiz	"Enter first term: "
	prompt2:	.asciiz "Enter common difference: "
	prompt3:	.asciiz "Enter number of terms: "
	prompt4:	.asciiz "Answer: "

.text
main:
	## Printing string in prompt1
	li		$v0, 4
	la 		$a0, prompt1
	syscall
	## Taking input of the first term and moving it to $t1
	li		$v0, 5
	syscall
	move	$t1, $v0

	## Printing string in prompt2
	li		$v0, 4
	la 		$a0, prompt2
	syscall
	## Taking input of the common difference and moving it to $t1
	li		$v0, 5
	syscall
	move	$t2, $v0

	## Printing string in prompt3
	li		$v0, 4
	la 		$a0, prompt3
	syscall
	## Taking input of number of terms and moving it to $t3
	li		$v0, 5
	syscall
	move	$t3, $v0

	## Initialising two more registers to zero
	li		$t4, 0
	li		$t5, 0

## Making a loop to add n th term of AP to $t5 and calculate n+1 th term of AP and store it in $t1
## $t5 contains the sum of n-1 terms of the AP in n th iteration of the loop.
loop:
	beq		$t4, $t3, end
	add		$t5, $t1, $t5
	add 	$t1, $t2, $t1
	addi	$t4, 1
	j		loop

## After the loop exits Sum of first n terms of the specified AP is printed. The sum is stored in $t5.
end:
	## Printing string in prompt4
	li		$v0, 4
	la 		$a0, prompt4
	syscall

	## Printing the final answer
	li		$v0, 1
	move	$a0, $t5
	syscall

	## Exit
	li		$v0, 10
	syscall