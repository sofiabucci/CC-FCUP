	.data

_str1:		.asciiz "fib("
_str2:		.asciiz ") = "
_str3:		.asciiz "\n"
_memFibs:	.word 0:1024

	.text
_main:
	la	$a2, _memFibs
	
	#definir os primeiros elementos memFibs = {0, 1, 1}
	li 	$t0, 1
	sw	$zero, 0($a2)
	addiu	$a2, $a2, 4

	sw	$t0, 0($a2)
	addiu	$a2, $a2, 4

	sw	$t0, 0($a2)
	addiu	$a2, $a2, -8

	#scanf
    	li	$v0,  5
   	syscall
    	move 	$a1, $v0

	li	$v0, 4
	la	$a0, _str1
	syscall

	li	$v0, 1
	move 	$a0, $a1
	syscall

    	jal _fib

	move $t0, $v0

	li	$v0, 4
	la	$a0, _str2
	syscall

	li  	$v0, 1
	move 	$a0, $t0
    	syscall

	li	$v0, 4
	la	$a0, _str3
	syscall

    	li 	$v0, 10
    	syscall

_fib:
    	# $a1 = n
    	# $a2 = memFibs[]
    	# if (n == 0) return 0;
    	# if (n == 1) return 1;
    	# return fib(n - 1) + fib(n - 2);

    	#save in stack
    	addiu 	$sp, $sp, -16 
    	sw   	$ra, 0($sp)
    	sw   	$s0, 4($sp)
    	sw   	$s1, 8($sp)
   	sw	$s2, 12($sp)

	# $s0 = memFibs[n]
	move	$t0, $a1
	sll	$t0, $t0, 2
	add	$a2, $a2, $t0
	
    	lw	$s0, 0($a2)

    	sub 	$a2, $a2, $t0

    	# if (memFibs[n] != 0) return memFibs[n]
    	sne	$t2, $s0, $zero
    	bne	$t2, $zero, _returnMemFibsN

    	#return 0
    	beq  	$a1, $zero, _return0

    	#return 1
    	li	$t1, 1
    	beq  	$a1, $t1, _return1
    	
	#caso recursivo
    	#fib(n-1)
    	addiu 	$a1, $a1, -1
    	jal 	_fib
    	addiu 	$a1, $a1, 1
    	move 	$s1, $v0        # $s1 = fib(n - 1)

    	#fib(n-2)
    	addiu 	$a1, $a1, -2
    	jal 	_fib
    	addiu 	$a1, $a1, 2
    	move	$s2, $v0 	# $s2 = fib(n-2)

    	#resultado final
    	add 	$v0, $s1, $s2   # $v0 = fib(n-1) + fib(n - 2)

    	# memFibs[n] = $v0
	move	$t0, $a1
	sll	$t0, $t0, 2
	add	$a2, $a2, $t0
    	sw	$v0, 0($a2)
    	sub 	$a2, $a2, $t0

_exitfib:
    	lw   	$ra, 0($sp)     # read registers from stack
    	lw   	$s0, 4($sp)
    	lw   	$s1, 8($sp)
    	lw	$s2, 12($sp)
    	addi 	$sp, $sp, 16    # bring back stack pointer
    	jr 	$ra

_returnMemFibsN:
	move	$v0, $s0
	j	_exitfib

_return1:
    	li 	$v0,1
    	j 	_exitfib
    	
_return0:     
    	li 	$v0,0
    	j 	_exitfib







