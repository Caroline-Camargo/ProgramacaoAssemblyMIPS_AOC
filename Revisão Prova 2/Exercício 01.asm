# NOME: Caroline Souza Camargo
# 11. Leia dois vetores de 5 números inteiros (word) e armazene na memória iniciando na
# posição 0x10010000. Concatene os vetores e imprima o resultado na tela.
# Exemplo
# vetor1: 1 5 4 3 5
# vetor2: 2 3 4 6 8
# saida: 1 5 4 3 5 2 3 4 6 8

.data
	vetorconcatenado: .word  0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	vetor1:  .word 1, 5, 4, 3, 5
	vetor2:  .word 2, 3, 4, 6, 8
	espaco: .asciiz "  "

.text 
	la $s0, vetorconcatenado
	li $s1 0		#i
	li $s2, 5		#tamanho
	la $s3, vetor1
	
	while:
	beq $s1, $s2, parte2		#i == tamanho
	lw $s4, 0($s3)
	sw $s4, 0($s0)
	
	addi $s3, $s3, 4					#vet1[i++]
	addi $s0, $s0, 4					#vet[i++]
	addi $s1, $s1, 1					# i++
	j while
	
	parte2:
	li $s1, 0		#i
	la $s3, vetor2
	
	while2:
	beq $s1, $s2, exibe		#i == tamanho
	lw $s4, 0($s3)
	sw $s4, 0($s0)
	
	addi $s3, $s3, 4					#vet1[i++]
	addi $s0, $s0, 4					#vet[i++]
	addi $s1, $s1, 1					# i++
	j while2
	
	exibe:
	li $s1, 0		#i
	li $s2, 10		#tamanho
	la $s0, vetorconcatenado
	
	while3:
	beq $s1, $s2, fim		#i == tamanho
	lw $a0, 0($s0)
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, espaco
	syscall
	
	addi $s0, $s0, 4					#vet1[i++]
	addi $s1, $s1, 1					# i++
	j while3
	
	fim:
	li $v0, 10
	syscall
	
