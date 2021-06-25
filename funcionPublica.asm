.data
.eqv len 10
presentacion: .asciiz  "************************************************** \n"
presentacion1: .asciiz "--Aportes Mensuales de un Trabajador Ecuatoriano en Sectores Publicos-- \n"
opcion: .asciiz "Ingresar salario del empleado Ecuatoriano: \n"
opcion2: .asciiz "\nTotal aporte Mensual:"
texto: .space len
conts: .double 1.00
.text
.globl funcionPublica
funcionPublica:
	addi $sp,$sp,-4
	sw $ra,($sp)
	addi $s0,$zero,0
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
	jal SeguroPensiones
	li $v0,4
   	la $a0,opcion2
	syscall
	l.d $f6,conts
	mul.d $f12,$f10,$f6
	li $v0,3
	syscall
	#--------
	lw $ra, ($sp)
	addi $sp,$sp,4
	#--------
	jr $ra
