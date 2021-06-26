.data
.eqv len 10
presentacion: .asciiz  "************************************************** \n"
presentacion1: .asciiz "--Aportes Mensuales de un Trabajador Ecuatoriano en Sectores Privado-- \n"
opcion: .asciiz "Ingresar salario del empleado Ecuatoriano: \n"
opcion2: .asciiz "\nTotal aporte Mensual: $"
texto: .space len
conts: .double 0.00
.text
.globl funcionPrivada
funcionPrivada:
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
	addi $a0,$zero,2
	l.d $f8,conts
	jal SeguroPensiones
	add.d $f8,$f10,$f8
	jal SeguroSalud
	add.d $f8,$f10,$f8
	jal SeguroTrabajo
	add.d $f8,$f10,$f8
	jal GastosAdministracion
	add.d $f8,$f10,$f8
	jal SeguroCesantia
	add.d $f8,$f10,$f8
	jal leyDiscapacidades
	add.d $f8,$f10,$f8
	jal SeguroCampesino
	add.d $f8,$f10,$f8
	li $v0,4
   	la $a0,opcion2
	syscall
	mov.d $f12,$f8
	li $v0,3
	syscall
	#--------
	lw $ra, ($sp)
	addi $sp,$sp,4
	#--------
	jr $ra
