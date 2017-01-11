.text
.global main

main:
	jal	readswitches
	jal	split

	#subtract start from switches to find end
	lw	$2, 1($sp)
	#addi	$2, $0, 32
	#lw	$3, 0($sp)
	#sub	$4, $2, $3
	#divi	$2, $2, 16
	srli	$4, $2, 4

	#subi	$sp, $sp, 1
	#sw	$3, 0($sp)
	sw	$4, 1($sp)

	jal 	count

	syscall

#takes a binary number and returns the 4 least and most significant bits
split:	
	#backup variables
	subi	$sp, $sp, 10
	sw	$2, 7($sp)
	sw	$3, 6($sp)
	sw	$4, 5($sp)
	sw	$5, 4($sp)
	sw	$6, 3($sp)
	sw	$7, 2($sp)
	sw	$8, 1($sp)
	sw	$ra, 0($sp)
	
	lw	$2, 9($sp)	#load input
	#sw	$2, 9($sp)
	add	$7, $2, $0
	addi	$3, $0, 4	#loop counter
	addi	$4, $0, 1	#binary number for anding
	add	$5, $0, $0	#set loop output to 0

	
loop:	
	subi	$3, $3, 1	#increment loop counter
	and	$6, $2, $4	#anding to find nth bit pos

	bnez	$6, addnum
	multi	$4, $4, 2	#moving anding num on bit right
	bnez	$3, loop
	j	endloop

addnum:
	add	$5, $5, $6
	
	#remove nth digit from endnum
	sub	$7, $7, $6
	multi	$4, $4, 2	#moving anding num on bit right
	
	bnez	$3, loop
	j	endloop

endloop:
	sw	$5, 8($sp)	#store output
	sw	$7, 9($sp)

	lw	$2, 7($sp)
	lw	$3, 6($sp)
	lw	$4, 5($sp)
	lw	$5, 4($sp)
	lw	$6, 3($sp)
	lw	$7, 2($sp)
	lw	$8, 1($sp)
	lw	$ra, 0($sp)
	addi	$sp, $sp, 8

	jr	$ra