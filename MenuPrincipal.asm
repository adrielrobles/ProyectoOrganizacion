.data
.eqv len 10
presentacion: .asciiz  "************************************************** \n"
presentacion1: .asciiz "---------------MENU PRINCIPAL--------------------- \n"
opcion1: .asciiz "1.- Conocer los aportes mensuales de un Trabajador Ecuatoriano\n"
opcion2: .asciiz "2.- Conocer los aportes anueles de un Trabajador Ecuatoriano\n"
opcion3: .asciiz "3.- Salir del programa\n"
opcion: .asciiz "Ingresar Opcion(1-3):\n"
saltoLinea: .asciiz "\n" 
texto: .space len
.text
.globl MenuPrincipal
MenuPrincipal:
Bucle:
	li $v0, 4
	la $a0, presentacion
	syscall
	la $a0, presentacion1
	syscall
	la $a0, presentacion
	syscall
	la $a0,opcion1
	syscall
	la $a0,opcion2
	syscall
	la $a0,opcion3
	syscall
	la $a0,opcion
	syscall
	li $v0,5
	la $a0,texto
	li $a1, len
	syscall
	move $t0,$v0
	beq $t0,1,funcion1
	beq $t0,2,funcion2
	beq $t0,3,funcion3
	j Bucle
funcion1:

funcion2:
funcion3:
li $v0,10
syscall
