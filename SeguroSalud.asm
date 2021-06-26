.data
aportePersonalPi: .double 0.0000
aportePatronalPi: .double 0.0516
aportePersonalPu: .double 0.0200
aportePatronalPu: .double 0.0316
conts: .double 0.00
presentacionPe: .asciiz "Aporte del seguro de Salud personal: $"
presentacionPa: .asciiz "Aporte del seguro de Salud patronal: $"
saltoLinea: .asciiz "\n"

.text
.globl SeguroSalud
SeguroSalud:
		addi $sp,$sp,-8
   		sw $ra,0($sp)
   		sw $a0,4($sp)	
   		#---------------
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
		add.d $f14,$f12,$f4# Resultado Personal
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
		add.d $f10,$f12,$f10
		add.d $f16,$f12,$f4# resultado Patronal
		li $v0,3
		syscall		
		j END
PRIVADO:	
		li $v0, 4
   		la $a0, presentacionPe
   		syscall
   		l.d $f0,aportePersonalPi
		mul.d $f12,$f2,$f0
		add.d $f10,$f12,$f4
		add.d $f14,$f12,$f4# Resultado Personal
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
		add.d $f16,$f12,$f4# resultado Patronal
		li $v0,3
		syscall	
END:		
		li $v0,4
   		la $a0,saltoLinea
		syscall
   		lw $ra, ($sp)
		lw $a0, 4($sp)
		addi $sp,$sp,8
		jr $ra


