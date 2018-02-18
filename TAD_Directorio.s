.data
Directorio: .word 0
.text
dir_init:
	#Prologo
	sw $fp,($sp)
	move $fp,$sp
	addi $sp,$sp,-4
	#Con esto pido 12 bytes de memoria (3 palabras)
	#En la primera palabra estara almacenado el tamaño (la cantidad de archivos)
	#En la segunda el primer archivo
	#Y el ultimo archivo
	li $v0,9
	li $a0,12
	syscall
	#Guardo la direccion de la estructura en la etiqueta en Directorio
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
	#Empiezo a buscar...

buscar_archivo:
	#Prologo
	sw $fp,($sp)
	move $fp,$sp
	sw $ra, -4($fp)
	addi $sp,$sp,-8
	move $s0,$a0
	#Esto esta en proceso
	lw $t0,4(Directorio)
loop_buscar_archivo:
	beqz $t0, buscar_fin