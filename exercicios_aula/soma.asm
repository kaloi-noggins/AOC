	.text
main:
	li $s1, -1
	li $s0,0
while:
	li $v0,5
	syscall
	
	beq $v0, $s1, endwhile
	add $s0,$s0,$v0
	j while

endwhile:
	move $a0,$s0
	li $v0, 1	
	syscall
	
end:
	li $v0,10
	syscall