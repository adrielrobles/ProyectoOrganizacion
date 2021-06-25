.data
aportePersonalPi: .double 0.0036
aportePatronalPi: .double 0.0044
presentacionPe: .asciiz "Aporte de Gastos de Administración personal: $"
presentacionPa: .asciiz "Aporte de Gastos de Administración patronal: $"
saltoLinea: .asciiz "\n"
.text
.globl SeguroCesantia
SeguroCesantia:
	addi $sp,$sp,-8
   	sw $ra,0($sp)
   	sw $a0,4($sp)	
   	#---------
   	li $v0,4
   	la $a0,saltoLinea
	syscall
   	la $a0,presentacionPe
	syscall
	l.d $f0,aportePersonalPi
	mtc1 $a1,$f2 # es un el valor entero aleatorio convertido a flotante
	cvt.d.w $f2,$f2
	mul.d $f12,$f2,$f0
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
	li $v0,3
	syscall
	li $v0,4
   	la $a0,saltoLinea
	syscall
	#--------
	lw $ra, ($sp)
	lw $a0, 4($sp)
	addi $sp,$sp,4
	#--------
	jr $ra
