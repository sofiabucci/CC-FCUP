	.data
_str1:		.asciiz "mdc("
_str2:		.asciiz ","
_str3:		.asciiz ") = "
_str4:		.asciiz "\n"

	.text
_main:
	#scanf i
	li 	$v0, 5
	syscall

	move	$a1, $v0

	#scanf j
	li	$v0, 5
	syscall

	move 	$a2,$v0

	#print "mdc("
	li	$v0, 4
	la	$a0, _str1
	syscall

	#print i
	li	$v0, 1
	move	$a0, $a1
	syscall

	#print ","
	li	$v0, 4
	la	$a0, _str2
	syscall

	#print j
	li	$v0, 1
	move	$a0, $a2
	syscall

	#print ") = "
	li	$v0, 4
	la	$a0, _str3
	syscall

	#chamar a função gcd
	jal	_gdc

	#print ao resultado
	move	$t0, $v0
	li	$v0, 1
	move	$a0, $t0
	syscall

	#print "\n"
	li	$v0, 4
	la	$a0, _str4
	syscall

	#return 0 / exit
	li 	$v0, 10
	syscall

_gdc:
	#save in stack
    	addiu 	$sp, $sp, -12 
    	sw   	$ra, 0($sp)
    	sw   	$s1, 4($sp)
   	sw	$s2, 8($sp)

   	# $s1 = i, $s2 = j
   	move	$s1, $a1
   	move	$s2, $a2 

	#caso base
	seq	$t0, $s2, $zero
	bnez	$t0, _returnI

	#caso recursivo
	move	$a3, $a1 #temp = i
	move	$a1, $a2 # i = j
	jal	_restoDiv
	jal	_gdc

#exit
_exitgdc:
    	lw   	$ra, 0($sp)     # read registers from stack
    	lw   	$s1, 4($sp)
    	lw	$s2, 8($sp)
    	addiu 	$sp, $sp, 12    # bring back stack pointer
    	jr 	$ra

_returnI:
	move	$v0, $s1
	j	_exitgdc

#fazer temp-j enquanto temp >= j
_restoDiv:
	sub	$a3, $a3, $a2 # temp - j
	sge	$t2, $a3, $a2
	bnez	$t2, _restoDiv

	# temp < j, logo já podemos substituir j por temp
	move	$a2, $a3
	jr	$ra

	





