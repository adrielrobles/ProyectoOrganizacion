.data
aportePersonalPi: .double 0.0664
aportePatronalPi: .double 0.0382
conts: .double 0.00
.eqv len 10
presentacionPe: .asciiz "Aporte del seguro general de pensiones personal: $"
presentacionPa: .asciiz "Aporte del seguro general de pensiones patronal: $"
texto: .space len
saltoLinea: .asciiz "\n"
.text
.globl SeguroPensiones
SeguroPensiones:
	addi $sp,$sp,-8
   	sw $ra,($sp)
   	sw $a0,4($sp)	
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
	lw $a0, 4($sp)
	addi $sp,$sp,4
	#--------
	jr $ra
