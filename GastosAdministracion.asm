.data
aportePersonalPi: .double 0.0036
aportePatronalPi: .double 0.0044
presentacionPe: .asciiz "Aporte de Gastos de Administración personal: $"
presentacionPa: .asciiz "Aporte de Gastos de Administración patronal: $"
saltoLinea: .asciiz "\n"
conts: .double 0.00
.text
.globl GastosAdministracion
GastosAdministracion:
	addi $sp,$sp,-8
   	sw $ra,0($sp)
   	sw $a0,4($sp)	
   	#---------
   	li $v0, 4
   	la $a0,presentacionPe
	syscall
	l.d $f4,conts
	l.d $f0,aportePersonalPi
	mtc1 $a1,$f2 # es un el valor entero aleatorio convertido a flotante
	cvt.d.w $f2,$f2
	mul.d $f12,$f2,$f0
	add.d $f10,$f12,$f4
	add.d $f14,$f12,$f4# Resultado Personal
	li $v0,3
	syscall
	li $v0,4
   	la $a0,saltoLinea
	syscall
	li $v0,4
   	la $a0,presentacionPa
	syscall
	l.d $f0,aportePatronalPi
	mul.d $f12,$f2,$f0
	add.d $f10,$f12,$f10
	add.d $f16,$f12,$f4# resultado Patronal
	li $v0,3
	syscall
	li $v0,4
   	la $a0,saltoLinea
	syscall
	#--------
	lw $ra, ($sp)
	lw $a0, 4($sp)
	addi $sp,$sp,8
	#--------
	jr $ra
