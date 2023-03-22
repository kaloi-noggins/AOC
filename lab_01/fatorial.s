.text

main:
	li $s0, 0 # guarda o fatorial
	li $s1, 1 # guarda 1
	
	li $v0, 5 # le inteiro
	syscall
	
	move $s0,$v0 # copia v0 para s0
	
while:	
	sub $v0, $v0, $s1 # tira 1 de v0
	mul $s0, $s0, $v0 # multiplica
	beq $v0, $s1, endwhile # se nao zero continua while
	j while
endwhile:
	move $a0, $s0
	li $v0, 1
	syscall
	j end
end:
	li $v0,10
	syscall