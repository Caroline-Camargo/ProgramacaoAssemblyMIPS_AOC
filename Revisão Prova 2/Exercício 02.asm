# NOME: Caroline Souza Camargo
# 12. Crie um programa para calcular a soma S de todos os números pares dentre os N
# números informados pelo usuário. Inicialmente, o número N deverá ser lido pelo
# teclado e, logo depois, serão lidos os N valores. Os N valores lidos devem ser
# armazenados na memória. O resultado S da soma de pares deverá ser apresentado na
# tela, assim como a quantidade Q de valores pares.
# Você deve criar uma sub-rotina para a leitura dos valores e uma sub-rotina para
# encontrar e somar os pares

.data
	vetor: .space 100 
	string1: .asciiz "\nDigite quantos numeros deverao ser digitados: "
	string2: .asciiz "\nDigite um numero: "
	string3: .asciiz "\nValores pares: "
	string4: .asciiz "\nQuantidade de valores pares:: "
	string5: .asciiz "\nSoma de valores pares: "
	espaco: .asciiz "   "

.text
	li $v0, 4
	la $a0, string1
	syscall
	li $v0, 5
	syscall
	
	move $s0, $v0
	
	move $a0, $s0
	jal leituraValores
	
	move $a0, $s0
	jal somaValoresPares
	
	li $v0, 10
	syscall

leituraValores:
	move $t0, $a0
	li $t1, 0
	la $t2, vetor
	
	while:
		beq $t0, $t1, continua
		
		li $v0, 4
		la $a0, string2
		syscall
		li $v0, 5
		syscall
		sw $v0, 0($t2)
		
		addi $t2, $t2, 4
		addi $t1, $t1, 1
	j while
	
	continua:
jr $ra


somaValoresPares:
	move $t0, $a0
	li $t1, 0
	li $t5, 0
	li $t6, 0
	la $t2, vetor
	
	li $v0, 4
	la $a0, string3
	syscall
	
	while2:
		li $v0, 4
		la $a0, espaco
		syscall
	
		beq $t0, $t1, continua2
		
		lw $t3, 0($t2)
		
		li $t4, 2
		div $t3, $t4
		mfhi $t4
		
		bne $t4, $zero, naopar
		li $v0, 1
		move $a0, $t3
		syscall
		
		add $t5, $t5, $t3
		add $t6, $t6, 1
		
		naopar:
		addi $t2, $t2, 4
		addi $t1, $t1, 1
	j while2
	
	continua2:
	li $v0, 4
	la $a0, string5
	syscall
	
	li $v0, 1
	move $a0, $t5
	syscall
	
	li $v0, 4
	la $a0, string4 
	syscall
	
	li $v0, 1
	move $a0, $t6
	syscall
jr $ra