	.data 
_squares: .word 0:100

	.text
_main:
	li $v0, 5
	syscall
	move $s1,$v0
	la $t0,_squares
	
	li $s0, 1
		
_loop: 
	beq $s1,$s0,_end
	mul $t1,$s0,$s0
	
	sw $t1,0($t0)
	
	addiu $t0,$t0,4
	addiu $s0,$s0,1
	
	j _loop
	
_end:
	li $v0, 10
	syscall
