# NOME: Caroline Souza Camargo
# 13. Escreva um programa que leia uma string de entrada e armazene na memória
# iniciando na posição 0x10010000. Transforme os caracteres maiúsculos de uma
# string em minúsculos e os caracteres minúsculos em maiúsculos.
# Por exemplo, a entrada:
# “ONE RING to rule Them aLL”
# Deve produzir:
# “one ring TO RULE tHEM All”.
# OBS: Use apenas uma string (não use uma string de saída ou uma string auxiliar no
# seu programa). Não esqueça de terminar a string com nulo. Mantenha a string de
# saída na mesma posição da string de entrada.

.data
string: .space 100
  
.text
	li $v0, 8
	la $a0, string
	li $a1, 32
	syscall
	
	la $s0, string
	li $s2, 32
	li $s3, 10													
	while:
		lb $s1, 0($s0)
		beq $s1, $zero, fim
		beq $s1, $s2, ignora			#é espaço
		beq $s1, $s3, ignora			#é  quebra de linha (enter)
		
		slti $t0, $s1, 91						#é maiuscula
		beq $t0, $zero, minuscula
		addi $s1, $s1, 32
		sb $s1, 0($s0)
		j ignora
		
		minuscula:
		addi $s1, $s1, -32
		sb $s1, 0($s0)
		
		ignora:
		addi $s0, $s0, 1
	j while
	
	fim:
	li $v0, 4
	la $a0, string
	syscall
	
	li $v0, 10
	syscall