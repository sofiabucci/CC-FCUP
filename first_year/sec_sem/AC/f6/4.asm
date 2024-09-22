	.data
_text:		.asciiz "This is the string to be used to generate the histogram"
_print1:	.asciiz " -> "
_print2:	.asciiz "\n"
_histogram:	.word 0:26

	.text
_main:
	la	$s0, _text
	la	$s1, _histogram	
	
	jal	_computeHistogram
	
	jal	_printHistogram
	
	li	$v0, 10
	syscall

_computeHistogram:

_loop1:
	li	$t0, 65 #codigo ascii do 'A'
	li	$t1, 90 #codigo ascii do 'Z'
	li	$t2, 97 #codigo ascii do 'a'
	li	$t3, 122 #codigo ascii do 'z'
	
	lb	$t4, 0($s0) #corresponde a t0 = str[i] (começa em i=0)
	beqz	$t4, _end1 #corresponde ao while(text[i] != '\0')

	#primeiro if statement
	sge	$t5, $t4, $t0
	sle	$t6, $t4, $t1
	and	$t7, $t5, $t6
	bnez	$t7, _computeUpper

	#segundo if statement
	sge	$t5, $t4, $t2
	sle	$t6, $t4, $t3
	and	$t7, $t5, $t6
	bnez	$t7, _computeLower

_computeLower:
	sub	$t5, $t4, $t2
	sll	$t5, $t5, 2
	add	$s1, $s1, $t5
	lw	$t6, 0($s1)
	addiu 	$t6, $t6, 1
	sw	$t6, 0($s1)
	sub	$s1, $s1, $t5
	addiu	$s0, $s0, 1 #corresponde ao i++

	j 	_loop1

_computeUpper:
	sub	$t5, $t4, $t0
	sll	$t5, $t5, 2
	add	$s1, $s1, $t5
	lw	$t6, 0($s1)
	addiu 	$t6, $t6, 1
	sw	$t6, 0($s1)
	sub	$s1, $s1, $t5
	addiu	$s0, $s0, 1 #corresponde ao i++
	j 	_loop1

_end1:
	jr $ra

_printHistogram:
	li	$t0, 0
	li	$t1, 26
	li	$t2, 0
	li	$t3, 97

_loop2:
	bge	$t0, $t1, _end2

	#print letra
	li	$v0, 11 #call para imprimir um caracter
	move	$a0, $t3
	syscall

	#print " -> "
	li	$v0, 4
	la 	$a0, _print1 # " -> "
	syscall

	#print numero de ocorrencias
	add	$s1, $s1, $t2
	lw	$t4, 0($s1)
	sub	$s1, $s1, $t2

	li	$v0, 1
	move	$a0, $t4
	syscall

	#print \n
	li	$v0, 4
	la 	$a0, _print2 # "\n"
	syscall

	#iteracoes
	addiu	$t0, $t0, 1
	addiu	$t2, $t2, 4
	addiu	$t3, $t3, 1

	#retomar ao inicio
	j	_loop2

_end2:
	jr	$ra
