.data
Directorio: .word 0
.text
dir_init:
	#Prologo
	sw $fp,($sp)
	move $fp,$sp
	addi $sp,$sp,-4
	li $v0,9
	li $a0,12
	syscall
	sw $v0, Directorio
	#Epilogo
	move $sp,$fp
	lw $fp,($sp)
	jr $ra

dir_cp:
	#Prologo
	sw $fp,($sp)
	move $fp,$sp
	addi $sp,$sp,-4

buscar_archivo:
	#Prologo
	sw $fp,($sp)
	move $fp,$sp
	sw $ra, -4($fp)
	addi $sp,$sp,-8
	move $s0,$a0
	lw $t0,4(Directorio)
loop_buscar_archivo:
	beqz $t0, buscar_fin