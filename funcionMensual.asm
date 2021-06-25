.data
.eqv len 10
presentacion: .asciiz  "************************************************** \n"
presentacion1: .asciiz "--Aportes Mensuales de un Trabajador Ecuatoriano en Sectores Publicos-- \n"
opcion: .asciiz "Ingresar salario del empleado Ecuatoriano: \n"
salarioA: .asciiz "Salario acordado por la empresa: \n"
salarioIess .asciiz "Aporte al IESS en sectores publicos: \n"
salarioIess .asciiz "Aporte al IESS en sectores privados: \n"
salarioFondo .asciiz "Aporte de fondos de reserva: \n"
texto: .space len
.text
.globl funcionMensual
funcionMensual:
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
	move $s0,$v0
	
	#--------
	lw $ra, ($sp)
	addi $sp,$sp,4
	#--------
	jr $ra