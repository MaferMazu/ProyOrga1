.data
nombre1: .asciiz ""
.text
dir_init:
#Guardar una dir en v0
dir_cp:
#Copia el contenido del archivo nombre1 al archivo nuevo nombre2.
#a0 String .asciiz nombre1
#a1 String nombre2
#Guardo en v0 salida

#Abro archivo nombre1
la $a0 nombre1
addi $a1, $zero, 0 #Abro con solo lectura
addi $v0,$zero,13 #Llamada para abrir
syscall
#Tengo que comprobar si es negativo
#Si es positivo
lw $a0,($v0) #Coloco en a0 el descriptor
la $a1 #Coloco en a1 la direccion de el input buffer
addi $a2,$zero,10000 #La cantidad maxima de caracteres
addi $v0, $zero, 14 # Llamada para leer
syscall

perror:
#a0 tengo el valor a comprobar