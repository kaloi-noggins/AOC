.globl main
.text

main:
	li $v0, 5
	syscall
	move $a0, $v0
	
	li $v0, 5
	syscall
	move $a1, $v0

	jal compara
	
	move $a0, $v0
	li $v0, 1
	syscall
end:
	li $v0, 10
	syscall
compara:
	sge $t0, $a0, $a1 #se a0 > a1, 1
	bnez $t0, maior # se a0 > a1 (1), vai para maior
	move $v0, $a1 #senao copia a1 para a0 retorno
	jr $ra
	maior:
		move $v0, $a0
		jr $ra