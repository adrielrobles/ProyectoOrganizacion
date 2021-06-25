.data
.eqv len 10
presentacion: .asciiz  "************************************************** \n"
presentacion1: .asciiz "--Aportes Mensuales de un Trabajador Ecuatoriano en Sectores Publicos-- \n"
opcion: .asciiz "Ingresar salario del empleado Ecuatoriano: \n"
texto: .space len
.text
.globl funcionPublica
funcionPublica:
	addi $sp,$sp,-4
	sw $ra,($sp)
   	#---------
   	li $v0,4
   	la $a0,presentacion
	syscall
	la $a0,presentacion1
	syscall
	la $a0,presentacion
	syscall
	la $a0,opcion
	syscall
	li $v0,5
	la $a0,texto
	li $a1, len
	syscall
	move $a1,$v0
	addi $a0,$a0,1
	jal SeguroPensiones
	jal SeguroSalud
	jal SeguroTrabajo
	jal SeguroCesantia
	#--------
	lw $ra, ($sp)
	addi $sp,$sp,4
	#--------
	jr $ra
