	.data 
_msg: .ascii "the result is \n"

	.text
_main:
	li $v0, 5
	syscall
	move $s1,$v0
	li $s2 1
	li $s3 0
		
_loop: 
	beq $s2,$s1,_end
	add $s3,$s2,$s3
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
