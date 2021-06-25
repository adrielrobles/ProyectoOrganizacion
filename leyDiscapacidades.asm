.data
aportePersonalPi: .double 0.001
aportePatronalPi: .double 0.000
conts: .double 0.00
.eqv len 10
presentacionPe: .asciiz "Aporte del Ley Orgánica de Discapacidades (LOD) personal: $"
presentacionPa: .asciiz "Aporte del Ley Orgánica de Discapacidades (LOD) patronal: $"
texto: .space len
saltoLinea: .asciiz "\n"
.text
.globl leyDiscapacidades
leyDiscapacidades:
	addi $sp,$sp,-4
   	sw $ra,($sp)
   	#---------
	li $v0,4
   	la $a0,presentacionPe
	syscall
	l.d $f0,aportePersonalPi
	mtc1 $a1,$f2 #s0 es un el valor entero aleatorio convertido a flotante
	cvt.d.w $f2,$f2
	mul.d $f12,$f2,$f0
	mtc1 $zero,$f4 #s0 es un el valor entero aleatorio convertido a flotante
	cvt.d.w $f4,$f4
	add.d $f10,$f12,$f4
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
	li $v0,3
	syscall
	li $v0,4
   	la $a0,saltoLinea
	syscall
	#--------
	lw $ra, ($sp)
	addi $sp,$sp,4
	#--------
	jr $ra
