.data
.eqv len 10
presentacion: .asciiz  "************************************************** \n"
presentacion1: .asciiz "--Aportes Mensuales de un Trabajador Ecuatoriano en Sectores Privado-- \n"
opcion: .asciiz "Ingresar salario del empleado Ecuatoriano: \n"
res: .asciiz "Total aporte Mensual: $"
resPer: .asciiz "Total aporte Mensual Personal: $"
resPat: .asciiz "Total aporte Mensual Patronal: $"
texto: .space len
saltoLinea: .asciiz "\n"
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
	l.d $f8,conts # variable aporte total
	l.d $f18,conts # variable aporte total personal
	l.d $f20,conts # variable aporte total patronal
	jal SeguroPensiones
	add.d $f8,$f10,$f8
	add.d $f18,$f14,$f18 #suma de Aporte Personal
	add.d $f20,$f16,$f20 #suma de Aporte Patronal
	jal SeguroSalud
	add.d $f8,$f10,$f8
	add.d $f18,$f14,$f18 #suma de Aporte Personal
	add.d $f20,$f16,$f20 #suma de Aporte Patronal
	jal SeguroTrabajo
	add.d $f8,$f10,$f8
	add.d $f18,$f14,$f18 #suma de Aporte Personal
	add.d $f20,$f16,$f20 #suma de Aporte Patronal
	jal GastosAdministracion
	add.d $f8,$f10,$f8
	add.d $f18,$f14,$f18 #suma de Aporte Personal
	add.d $f20,$f16,$f20 #suma de Aporte Patronal
	jal SeguroCesantia
	add.d $f8,$f10,$f8
	add.d $f18,$f14,$f18 #suma de Aporte Personal
	add.d $f20,$f16,$f20 #suma de Aporte Patronal
	jal leyDiscapacidades
	add.d $f8,$f10,$f8
	add.d $f18,$f14,$f18 #suma de Aporte Personal
	add.d $f20,$f16,$f20 #suma de Aporte Patronal
	jal SeguroCampesino
	add.d $f8,$f10,$f8
	add.d $f18,$f14,$f18 #suma de Aporte Personal
	add.d $f20,$f16,$f20 #suma de Aporte Patronal
	li $v0,4
   	la $a0,res
	syscall
	mov.d $f12,$f8
	li $v0,3
	syscall
	li $v0,4
   	la $a0,saltoLinea
	syscall
	la $a0,resPer
	syscall
	mov.d $f12,$f18
	li $v0,3
	syscall
	li $v0,4
   	la $a0,saltoLinea
	syscall
	la $a0,resPat
	syscall
	mov.d $f12,$f20
	li $v0,3
	syscall
	li $v0,4
   	la $a0,saltoLinea
	syscall
	lw $ra,($sp)
	addi $sp,$sp,4
	#--------
	jr $ra
