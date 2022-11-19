# NOME: Caroline Souza Camargo
# 3. Escreva um programa que leia um vetor de 10 posições (.word) da memória
# (começando na posição 0x10010000) e verifique se o vetor está ou não ordenado.
# Use o registrador $t0 como flag.
# Faça $t0 = 1 se o vetor estiver ordenado e $t0 = 0 caso contrário

.data
	vetor:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text
	li $t0, 1		#flag
	la $s0, vetor		
	li $s1, 9		#tamanho - 1 
	li $s2, 1			#i
	
	while:
		beq $s1, $s2, fim	#tamanho == i
		lw $s3, 0($s0)			#vet[i]
		lw $s4, 4($s0)			#vet[i+1]
		
		slt $s5, $s3, $s4		#vet[i] < vet[i+1]
		beq $s5, $zero, nao 		#
		
		addi $s2, $s2, 1		#i++
		addi $s0, $s0, 4		#vet++
		j while
		
	nao:
		li $t0, 0			#nao esta ordenado
		
	fim:
	li $v0, 10
	syscall