.text
.global	decryptAndPrint

decryptAndPrint:
	#store every variable to be used
	subi	$sp, $sp, 5
	sw	$1, 4($sp)	#$1 = output
	#$2 & $3 = encrypted input and decryption key
	sw	$2, 3($sp)
	sw	$3, 2($sp)
	sw	$ra, 1($sp)	#save return address

	#load inputs
	lw	$2, 6($sp)
	lw	$3, 5($sp)

	xor	$1, $2, $3	#decrypt input
	sw	$1, 0($sp)	#is this how to pass a register??
	jal	putc

	#clean up mess in register
	lw	$1, 4($sp)
	lw	$2, 3($sp)
	lw	$3, 2($sp)
	lw	$ra, 1($sp)
	addi	$sp, $sp, 5

	#return
	jr	$ra