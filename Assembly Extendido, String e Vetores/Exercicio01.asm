# # NOME: Caroline Souza Camargo
# 1. Escreva um programa que remova os espaços de uma string. Por exemplo, a entrada
# .data
# string: .asciiz “Gosto muito do meu professor de AOC-I."
# deve produzir a string
# " GostomuitodomeuprofessordeAOC-I.“
# Use apenas uma string (não use uma string de saída ou uma string auxiliar no seu
# programa). Não esqueça de terminar sua string com nulo (ver tabela ASCII para
# código do espaço e do \0 (null)).
# A resposta deve ser a string de entrada modificada, e não uma nova string na
# memória, ou seja, iniciando no endereço de memória 0x10010000

.data
	string: .asciiz "Gosto muito do meu professor de AOC-I."
	
.text
	la $s0, string		#s
	li $s1, 0x20			#espaço
		
	while:
		lb $s2, 0($s0)
		beq $s2, $zero, fim			#s[i] == \0
		bne $s2, $s1, naotemespaco	#s[i] == espaço
		
		move $s3, $s0				
		while2:			#Desloca os caracteres
			lb $s4, 1($s3)
			beq $s4, $zero, continua			#s'[i] == \0
			sb $s4, 0($s3)
			addi $s3, $s3, 1
			j while2
		
		continua:
		li $s4 0x0			#\0
		sb $s4, 0($s3)
		
		naotemespaco:
		addi $s0, $s0, 1							#s++
		j while
	
	fim:
	li $v0, 4
	la $a0, string
	syscall
	
	li $v0, 10
	syscall
	