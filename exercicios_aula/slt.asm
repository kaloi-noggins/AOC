main:
	li $s0, 2 #a
	li $s1, 3 #b
	slt $t0,$s0,$s1 # 0 se a > b, 1 se a < b
	beqz $t0, ignora # se a < b, ignora addii abaixo
	addi $s0,$s0,30
ignora:
	addi $s1, $s1, 10
end:
	li $v0, 1 #display int
	
	move $a0, $s0
	syscall
	
	move $a0, $s1
	syscall
	
	li $v0, 10
	syscall
	