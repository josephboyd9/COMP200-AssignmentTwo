.global	count
.text
count:
	subui	$sp, $sp, 7
	sw	$6, 1($sp)
	sw	$7, 2($sp)
	sw	$12, 3($sp)
	sw	$13, 4($sp)
	sw	$ra, 5($sp)
	lw	$13, 7($sp)
	sw	$13, 6($sp)
	lw	$12, 8($sp)
	seq	$13, $13, $12
	bnez	$13, L.1
	lw	$13, 6($sp)
	sgt	$13, $0, $13
	bnez	$13, L.6
	addui	$7, $0, 1
	j	L.7
L.6:
	addu	$7, $0, $0
L.7:
	sgei	$13, $7, 100
	bnez	$13, L.1
	lw	$13, 8($sp)
	sgt	$13, $0, $13
	bnez	$13, L.8
	addui	$6, $0, 1
	j	L.9
L.8:
	addu	$6, $0, $0
L.9:
	sgei	$13, $6, 100
	bnez	$13, L.1
	j	L.11
L.10:
	lw	$13, 7($sp)
	sw	$13, 0($sp)
	jal	writessd
	jal	delay
	lw	$13, 7($sp)
	lw	$12, 8($sp)
	sge	$13, $13, $12
	bnez	$13, L.13
	lw	$13, 7($sp)
	addi	$13, $13, 1
	sw	$13, 7($sp)
	j	L.14
L.13:
	lw	$13, 7($sp)
	subi	$13, $13, 1
	sw	$13, 7($sp)
L.14:
L.11:
	lw	$13, 7($sp)
	lw	$12, 8($sp)
	sne	$13, $13, $12
	bnez	$13, L.10
	lw	$13, 7($sp)
	sw	$13, 0($sp)
	jal	writessd
	jal	delay
L.1:
	lw	$6, 1($sp)
	lw	$7, 2($sp)
	lw	$12, 3($sp)
	lw	$13, 4($sp)
	lw	$ra, 5($sp)
	addui	$sp, $sp, 7
	jr	$ra
