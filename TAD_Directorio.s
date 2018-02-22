.data
Directorio: .word 0
error1: .asciiz "Error -1: Hubo un problema al inicializar el directorio"
error2: .asciiz "Error -2: Hubo un problema con la copia de los archivos"
error 3: .asciiz ""
.text
dir_init:
	#Prologo
	sw $fp,0($sp)
	move $fp,$sp
	addi $sp,$sp,-4
	#Con esto pido 12 bytes de memoria (3 palabras)
	#En la primera palabra estara almacenado el tamaño (la cantidad de archivos)
	#En la segunda el primer archivo
	#Y el ultimo archivo
	li $v0,9
	li $a0,12
	syscall
	sw $v0,Directorio
	bgtz $v0,init_sigo
	addi $v0,$zero,-1
	#Epilogo
	move $sp,$fp
	lw $fp,0($sp)
	jr $ra
init_sigo:
	add $v0,$zero,$zero
	#Epilogo
	move $sp,$fp
	lw $fp,0($sp)
	jr $ra
	
dir_cp:
	#Prologo
	sw $fp,0($sp)
	move $fp,$sp
	addi $sp,$sp,-4
	#Busco mi archivo con nombre a0 y lo guardo en $s0
	#Coloco mis argumentos
	move $a0,$a1
	lw $a1,32($s0)
	jal dir_make
	beqz cp_sigo
	add $v0,$zero,-2	
cp_sigo:
	#Epilogo
	move $sp,$fp
	lw $fp,0($sp)
	jr $ra
	
dir_make:
	#Argumentos a0 nombre, $a1 contenido
	#Prologo
	sw $fp,0($sp)
	move $fp,$sp
	#Guardo en s0 mi primer argumento
	move $s0,$a0
	#Guardo en $s1 mi segundo argumento
	move $s1,$a1
	addi $sp,$sp,-4
	#Pido espacio para una estructura de tipo archivo
	#Con los atributos:
	# Nombre 20 bytes
	# Tamano 4 bytes
	# Cifrado 4 bytes(0 si no esta cifrado y 1 si lo esta)
	# Contenido 100 bytes
	# Apunto al siguiente 4 bytes
	li $v0,9
	li $a0,134
	syscall
	sw $s0,0($v0) #Guardo el nombre 20bytes
	#El tamano aun no lo se 4bytes
	sw $zero, 28($v0) #No esta cifrado
	sw $s1, 32($v0) #Guardo el contenido (Preguntar porque en un registro no caben mas de 4 bytes)
	sw $zero, 132($v0) #Guardo el apuntador al siguiente
	lw $t0,Directorio #En t0 guardo la direccion de Directorio
	lw $t1,8(Directorio) #Guardo en $t1 la direccion del ultimo archivo
	sw $v0,132($t1) #Guardo el apuntador de mi nuevo archivo en el siguiente del ultimo archivo
	sw $v0,8(Directorio) #Guardo como ultimo al nodo nuevo.
	#Aumento el tamano.
	addi $t0,$t0,1
	sw $t0,Directorio
	#Mi retorno
	add $v0,$zero,$zero
	#Epilogo
	move $sp,$fp
	lw $fp,0($sp)
	jr $ra
	
dir_rm: