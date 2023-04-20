.text
.globl main

main:
	# le inteiro
	li $v0, 5
	move $a0, $v0
	syscall 

	# chama soma
	jal soma
	
	# print soma
	move $a0, $v0
	li $v0, 1
	syscall
end:
	li $v0, 10
	syscall
soma:
	# checa se zero
	beqz $a0, parada
	
	# senao empilha ra e v0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $v0, 4($sp)
	
	# tira 1 de v0
	addi $v0, $v0, -1
	# atribui v0 a a0
	move $a0, $v0
	
	# recursao
	jal soma
	
	# desempilha
	lw $ra, 0($sp)
	lw $t0, 4($sp)
	
	# soma resultado
	add $v0, $v0, $t0
	
	# limpa pilha
	addi $sp, $sp, 8
	
	# desempilha até zerar pilha
	jr $ra
	
parada:
	move $a0, $v0
	jr $ra
	
