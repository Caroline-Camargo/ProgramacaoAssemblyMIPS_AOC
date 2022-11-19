# NOME: Caroline Souza Camargo
# 5. Declare três vetores do mesmo tamanho:
# .data
# tamanho: .word 7
# vetor1: .word -30, -23, 56, -43, 72, -18, 71
# vetor2: .word 45, 23, 21, -23, -82, 0, 69
# soma: .word 0, 0, 0, 0, 0, 0, 0
# Inicialize um ponteiro para cada vetor (pseudo-instrução la) e faça a soma dos
# elementos dos vetores 2 a 2.
# O vetor resultante deve ser armazenado depois dos elementos do segundo vetor.
# Exemplo: soma[i] = vetor1[i]+vetor2[i]

.data
	tamanho: .word 7
	vetor1: .word -30, -23, 56, -43, 72, -18, 71
	vetor2: .word 45, 23, 21, -23, -82, 0, 69
	soma: .word 0, 0, 0, 0, 0, 0, 0
	quebralinha: .asciiz "   "


.text
	la $s0, vetor1
	la $s1, vetor2
	la $s2, soma
	lw $s3, tamanho
	li $s4, 1 # i
	
	while:
	beq $s4, $s3, exibe 	#i == tamanho
	
	lw $s5, 0($s0)
	lw $s6, 0($s1)
	add $s5, $s5, $s6
	
	sw $s5, 0($s2)
	
	addi $s0, $s0, 4			#vetor1[i++]
	addi $s1, $s1, 4			#vetor2[i++]
	addi $s2, $s2, 4			#soma[i++]
	addi $s4, $s4, 1			#i++
	j while
	
	exibe:
	addi $s4, $zero, 1			#i++
	la $s2, soma
	
	while2:
	beq $s4, $s3, fim 	#i == tamanho
	lw $s5, 0($s2)
	
	li $v0, 1
	move $a0, $s5
	syscall
	
	li $v0, 4
	la $a0, quebralinha
	syscall
	
	addi $s2, $s2, 4			#soma[i++]
	addi $s4, $s4, 1			#i++
	j while2
	
	fim:
	li $v0, 10
	syscall