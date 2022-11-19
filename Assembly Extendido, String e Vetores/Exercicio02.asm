# NOME: Caroline Souza Camargo
# 2. Escreva um programa que altere uma string para “capitalizar” a primeira letra de cada
# palavra. Por exemplo, a entrada
# .data
# string: .asciiz "meu professor é muito bom"
# deve produzir a string
# "Meu Professor É Muito Bom"
# Assuma que a entrada possui apenas espaços e letras minúsculas. Pode haver mais de
# um espaço entre as palavras.
# A resposta deve ser a string de entrada modificada, e não uma nova string na
# memória, ou seja, iniciando no endereço de memória 0x10010000.

.data
	string: .asciiz "meu professor é muito bom" 
	
.text 
	la $s0, string 
	li $s1, 0x20			#espaço
	
	# Coloca em maiúsculo o primeiro caracter
	lb $s2, 0($s0)	
	addi $s2, $s2,  -32
	sb $s2, 0($s0)
	addi $s0, $s0, 1
	
	# Coloca em maiúsculo o caracter que aparece após um espcaço
	 while:
	 	lb $s2, 0($s0)
	 	beq $s2, $zero, fim			#s[i] == \0
	 	bne $s2, $s1, continua	#s[i] != espaco
	 	
	 	addi $s0, $s0, 1
	 	lb $s2, 0($s0)
	 	addi $s2, $s2,  -32
	 	sb $s2, 0($s0)
	 	
	 	continua:
	 	addi $s0, $s0, 1						#s[i++] 
	  j while 
	  
	fim:
	li $v0, 4
	la $a0, string
	syscall
	
	li $v0, 10
	syscall
	