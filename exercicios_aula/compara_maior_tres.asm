.globl main
.text

main:
	li $v0, 5
	syscall
	move $a0, $v0
	
	li $v0, 5
	syscall
	move $a1, $v0
	
	li $v0, 5
	syscall
	move $a2, $v0
	
compara_tres:
	sge $t0, $a0, $a1
	sge $t1, $a1, $a2
	
	