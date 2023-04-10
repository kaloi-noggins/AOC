	.text
	.globl main
main:
	li $a0, 4
	jal fatorial
	move $a0, $v0
	li $v0, 1
	syscall
fatorial:
	# if a0<1
	blt $a0, 1, fat_parada
	#salvar contexto
	addi $sp,$sp,-8
	sw $s0, 0($sp)
	sw $ra, 4($sp)
	#codigo principal com chamada recursiva
	move $s0,$a0
	addi $a0,$a0,1
	jal fatorial
	mul $v0, $v0, $s0
	#restaurar
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	#retornar
	jr $ra
fat_parada:
	ori $v0,$zero, 1
	jr $ra
end:
	li $a0, 10
	syscall