.text
.globl main

main:
	ori $a0, $zero, 1 #g
	ori $a1, $zero, 1 #h
	ori $a2, $zero, 1 #i
	ori $a3 $zero, 1 #j
	
	jal leaf_example # chama funcao leaf_example, passando os conteudos de a0-a3 como argumentos, e salva o endereco de retorno (ra)

	move $a0, $v0,
	
	li $v0, 1
	syscall 
end:
	li $v0, 10
	syscall

leaf_example:
	addi $sp, $sp, -8 # aloca 4 bytes para s0 e s1 (4 bytes para cada registrador, 8 bytes no total). -8 pois stack começa em 0xFFFF e cresce para 0
	
	sw $s0, 0($sp) # salva s0 em 0 da pilh (0 a 4 bytes) 
	sw $s1, 4($sp) # salva em 1 da pilha (4 a 8 bytes)
	
	add $s0, $a0, $a1 # g + h
	add $s1, $a1, $a2 # i + j
	sub $v0, $s0, $s1 # (g+h) - (i+j)
	
	lw $s0, 0($sp) # restaura s0  
	lw $s1, 4($sp) # restaura s1
	
	addi $sp, $sp, 8 # desaloca a pilha
	
	jr $ra #retorna para main. ra contem endereço de onde jal foi chamado pela ultima vez
