.data
	msg: .asciiz "ERRO\n"
	pula: .asciiz "\n"
.text

main:
	li $s0, -1 # parada
	li $s1, 0 #soma
	li $s2, 0 #qtd num

while:
	li $v0, 5
	syscall
		
	beq $v0,$s0,endwhile # se -1 termina o while
	add $s1,$s1,$v0 # adiciona o numero lido em v0 em s1
	addi $s2,$s2,1 # adiciona 1 ao contador de numeros
	j while
	
endwhile:
	beqz $s2,zero # se a quantidade de numeros lidos foi 0 vai impreime erro
	j nonzero # senao imprime soma e media
		
nonzero:
	
	li $v0, 1 # seta syscall para imprimir um inteiro
	move $a0, $s1 # copia soma para a0
	syscall
	
	li $v0, 4 # seta syscall para imprimir string
	la $a0, pula
	syscall
	
	li $v0, 1 # seta syscall para imprimir um inteiro
	div $a0,$s1,$s2	 # faz divisao e salva em a0
	syscall
	
	j end
zero:
	li $v0, 1 # seta syscall para imprimir um inteiro
	move $a0, $s1 # copia soma para a0
	syscall

	li $v0, 4 # seta syscall para imprimir string
	la $a0, pula # imprime \n
	syscall
	
	la $a0, msg # imprime mensagem de erro 
	syscall
	j end

end:
	li $v0,10
	syscall
