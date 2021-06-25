.data
aportePersonalPi: .double 0.0000
aportePatronalPi: .double 0.0516
aportePersonalPu: .double 0.0020
aportePatronalPu: .double 0.0038
conts: .double 0.00
presentacionPe: .asciiz "Aporte del seguro de riesgo del trabajo personal: $"
presentacionPa: .asciiz "Aporte del seguro de riesgo del trabajo patronal: $"
saltoLinea: .asciiz "\n"

.text
.globl SeguroTrabajo
SeguroTrabajo:
		addi $sp,$sp,-8
   		sw $ra,0($sp)
   		sw $a0,4($sp)	
   		#---------------
   		li $v0,4
   		la $a0,saltoLinea
		syscall
   		l.d $f4,conts
   		mtc1 $a1,$f2 
		cvt.d.w $f2,$f2
   		beq $a0, 2 ,PRIVADO
   		li $v0, 4
   		la $a0, presentacionPe
   		syscall
   		l.d $f0,aportePersonalPu
		mul.d $f12,$f2,$f0
		add.d $f10,$f12,$f4
		li $v0, 3
		syscall
		li $v0,4
   		la $a0,saltoLinea
		syscall
		li $v0, 4
		la $a0, presentacionPa
		syscall
		l.d $f0,aportePatronalPu
		mul.d $f12,$f2,$f0
		li $v0,3
		syscall		
		add.d $f10,$f12,$f10
		j END
PRIVADO:	li $v0, 4
   		la $a0, presentacionPe
   		syscall
   		l.d $f0,aportePersonalPi
		mul.d $f12,$f2,$f0
		add.d $f10,$f12,$f4
		li $v0, 3
		syscall
		li $v0,4
   		la $a0,saltoLinea
		syscall
		li $v0, 4
		la $a0, presentacionPa
		syscall
		l.d $f0,aportePatronalPi
		mul.d $f12,$f2,$f0
		add.d $f10,$f12,$f10
		li $v0,3
		syscall	
   		#---------------
   		lw $ra, ($sp)
		lw $a0, 4($sp)
		addi $sp,$sp,4
		#---------------
END:		jr $ra