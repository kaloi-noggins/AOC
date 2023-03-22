.data
.text

main:
	li $s0, 1 # fib(n-2)
	li $s1, 1 # fib(n-1)
	li $s2, 1 # fib(n)
	
	li $v0, 5 # seta syscall para receber um inteiro
	syscall
	
	move $s3, $v0 #copia o numero da sequencia de fibromialgia que tem ser calculado
	
	li $t0, 1 #const 1
	
	beqz $s3,end # se 0 vai para final 
while:
	beq $s3, $t0, end
	addi $s3,$s3, -1
	add $s2,$s1,$s0
	move $s0,$s1
	move $s1,$s2
	j while
		
end:
	li $v0, 1
	move $a0, $s2
	syscall
	 
	li $v0, 10
	syscall