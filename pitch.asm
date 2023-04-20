.text
.globl main

main:
	li $v0, 31
	li $a0, 112
	li $a1, 5000
	li $a2,  40
	li $a3, 127
	syscall
	
	li $a0, 61
	syscall
	
	li $a0, 69
	syscall