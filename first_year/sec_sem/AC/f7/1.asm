	.data
prompt: .asciiz "Enter a number: "

	.text
    	.globl _main

_main:
   	li $v0, 4             
   	la $a0, prompt        
  	syscall

	li $v0, 5       
 	syscall
 	
  	move $a0, $v0         
	jal _fib

   	move $t0, $v0   
   	      
	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 10            
	syscall

_fib:
    	# $a0 = n
    	# if (n == 0) return 0;
    	# if (n == 1) return 1;
    	# return fib(n - 1) + fib(n - 2);

    	#save in stack
    	addi 	$sp, $sp, -16 
    	sw   	$ra, 0($sp)
    	sw   	$s0, 4($sp)
    	sw   	$s1, 8($sp)
   	sw	$s2, 12($sp)

    	move 	$s0, $a0

    	#return 0
    	beq  	$s0, $zero, _return0

    	#return 1
    	li	$t1, 1
    	beq  	$s0, $t1,   _return1

    	#caso recursivo
    	#fib(n-1)
    	subi 	$a0, $s0, 1
    	jal 	_fib
    	move 	$s1, $v0        # $s1 = fib(n - 1)

    	#fib(n-2)
    	subi 	$a0, $s0, 2
    	jal 	_fib
    	move	$s2, $v0 	# $s2 = fib(n-2)

    	#resultado final
    	add 	$v0, $s1, $s2   # $v0 = fib(n-1) + fib(n -
    	
    	
_exitfib:
    	lw   	$ra, 0($sp)     # read registers from stack
    	lw   	$s0, 4($sp)
    	lw   	$s1, 8($sp)
    	lw	$s2, 12($sp)
    	addi 	$sp, $sp, 16    # bring back stack pointer
    	jr 	$ra

_return1:
    	li 	$v0,1
    	j 	_exitfib

_return0:     
    	li 	$v0,0
    	j 	_exitfib

    	
    	
    	
          