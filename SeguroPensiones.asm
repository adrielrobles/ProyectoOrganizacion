.data
aportePersonalPi: .double 0.0664
aportePatronalPi: .double 0.0382
.eqv len 10
presentacionPe: .asciiz "Aporte del seguro general de pensiones personal: $"
presentacionPa: .asciiz "Aporte del seguro general de pensiones patronal: $"
texto: .space len
saltoLinea: .asciiz "\n"
.text
.globl SeguroPensiones
SeguroPensiones:
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
	#--------
	lw $ra, ($sp)
	addi $sp,$sp,4
	#--------
	jr $ra
