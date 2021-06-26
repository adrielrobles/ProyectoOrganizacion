.data
aportePersonalPi: .double 0.0035
aportePatronalPi: .double 0.0035
conts: .double 0.00
.eqv len 10
presentacionPe: .asciiz "Aporte del Seguro social campesino personal: $"
presentacionPa: .asciiz "Aporte del Seguro social campesino patronal: $"
texto: .space len
saltoLinea: .asciiz "\n"
.text
.globl SeguroCampesino
SeguroCampesino:
	addi $sp,$sp,-8
   	sw $ra,($sp)
   	sw $a0,4($sp)	
   	#---------
	li $v0,4
   	la $a0,presentacionPe
	syscall
	l.d $f4,conts
	l.d $f0,aportePersonalPi
	mtc1 $a1,$f2 #s0 es un el valor entero aleatorio convertido a flotante
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
	add.d $f10,$f10,$f12
	add.d $f16,$f12,$f4# resultado Patronal
	li $v0,3
	syscall
	li $v0,4
   	la $a0,saltoLinea
	syscall
	#--------
	sw $a0,4($sp)	
	lw $ra,($sp)
	addi $sp,$sp,8
	#--------
	jr $ra
