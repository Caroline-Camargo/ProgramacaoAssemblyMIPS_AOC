# NOME: Caroline Souza Camargo
# 4. Escreva um programa que inverta a ordem dos elementos de um vetor (.word) com 5
# posições. Por exemplo, a entrada: 1, 2, 3, 4, 5 deve produzir 5, 4, 3, 2, 1.
# A resposta deve ser o vetor de entrada modificado, e não um novo vetor na memória,
# ou seja, iniciando no endereço de memória 0x10010000.

.data
	vetor:  .word 1, 2, 3, 4, 5

.text 
	la $s0, vetor
	li $s1, 4		
	
	lw $s2, 0($s0)			#vet[0]
	lw $s3, 16($s0)		#vet[4]
	
	# troca os elementos de lugar 
	sw $s2, 16($s0)		
	sw $s3, 0($s0)		
	
	lw $s2, 4($s0)			#vet[1]
	lw $s3, 12($s0)		#vet[3]
	
	# troca os elementos de lugar 
	sw $s2, 12($s0)		
	sw $s3, 4($s0)		
	
	fim:
	li $v0, 10
	syscall