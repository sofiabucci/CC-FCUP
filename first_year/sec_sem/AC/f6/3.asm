	.data 
_msg: .ascii "the result is \n"

	.text
_main:
	li $v0, 5
	syscall
	move $s1,$v0
	li $s2 0
	li $s3 0
		
_loop: 
	beq $s2,$s1,_end
	mul $s4,$s2,$s2
	add $s3, $s4, $s3
	addi $s2,$s2,1
	j _loop
	
_end:
	li $v0,4
	la $a0,_msg
	syscall
	li $v0,1
	move $a0,$s3
	syscall
	li $v0, 10
	syscall
