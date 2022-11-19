# NOME: Caroline Souza Camargo
# 10. Escreva um programa que conte com três subrotinas capazes de calcular a área da
# circunferência (pi*r^2), do triângulo (b*a/2) e do retângulo (b*a). Inicialmente,
# pergunte ao usuário (use syscall) qual forma geométrica ele deseja (armazenando no
# registrador $t0) e depois solicite as medidas necessárias para calcular a área de cada
# forma (armazenar para circunferência o valor r em $t0, triângulo e retângulo
# armazenar valor de a e b em $t0 e $t1, respectivamente). Ao final, imprima a área
# desejada. Respeite as convenções de uso dos registradores.
# Considere pi=3.

.data 
	menu:  .asciiz "\nEscolha uma opção: \n1- Área da circuferencia\n2 - Área do triângulo\n3 - Área do retângulo\n"
	string1: .asciiz "\nDigite o raio: "
	string2: .asciiz "\nDigite a base: "
	string3: .asciiz "\nDigite a altura: "
	string4: .asciiz "\nArea: "

.text
	li $v0, 4
	la $a0, menu
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $s1, 1
	beq $t0, $s1, Circuferencia
	 
	li $s1, 2
	beq $t0, $s1, Triangulo
	
	 jal areaRetangulo
	 j fim
	 
	Circuferencia:
	 jal areaCircuferencia
	 j fim
	 
	Triangulo:
	 jal areaTriangulo

fim:
	move $t0, $v0		#area
	li $v0, 4
	la $a0, string4
	syscall 
	li $v0, 1
	move $a0, $t0
	syscall 

	li $v0, 10
	syscall


areaCircuferencia:
	li $v0, 4
	la $a0, string1
	syscall
	li $v0, 5
	syscall
	move $t0, $v0		#raio
	
	mult $t0, $t0			#raio^2
	mflo $t0
	
	li $t1, 3
	mult $t0, $t1			#pi * raio^2
	mflo $v0						#area
jr $ra

areaTriangulo:
	li $v0, 4
	la $a0, string2
	syscall
	li $v0, 5
	syscall
	move $t0, $v0		#base
	
	li $v0, 4
	la $a0, string3
	syscall
	li $v0, 5
	syscall
	move $t1, $v0 		#altura
	
	mult $t0, $t1			#base * altura
	mflo $t0
	
	li $t1, 2
	div $t0, $t1				#base * altura / 2
	mflo $t0
	
	move $v0, $t0		#area
jr $ra

areaRetangulo:
	li $v0, 4
	la $a0, string2
	syscall
	li $v0, 5						
	syscall
	move $t0, $v0		#base 
	
	li $v0, 4
	la $a0, string3
	syscall
	li $v0, 5
	syscall
	move $t1, $v0		#altura
	
	mult $t0, $t1			#base  * altura
	mflo $t0
	move $v0, $t0		#area
jr $ra