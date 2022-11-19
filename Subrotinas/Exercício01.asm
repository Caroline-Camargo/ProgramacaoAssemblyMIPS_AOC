# NOME: Caroline Souza Camargo
# 7. Escreva uma subrotina que retorne a média entre três valores. A subrotina deve
# receber como argumentos três inteiros e retornar a média entre eles. Escreva um
# programa para testar a subrotina que leia três valores do usuário e imprima o
# resultado. Importante: Utilize os registradores convencionados para a passagem de
# argumentos e valor de retorno! Armazene o retorno da subrotina (média entre os três
# valores) no registrador $t5.
# Exemplo:
# Entrada Saída
# 51
# 42
# 39 44 -- 44 também deve ser armazenado em $t5

.data
	string1: .asciiz "\nDigite um numero: "
	string2: .asciiz "\nMédia: "
	
.text
	li $v0,  4
	la $a0, string1
	syscall
	li $v0,  5
	syscall
	
	move $s0, $v0
	
	li $v0,  4
	la $a0, string1
	syscall
	li $v0,  5
	syscall
	
	move $s1, $v0
	
	li $v0,  4
	la $a0, string1
	syscall
	li $v0,  5
	syscall
	
	move $a0, $s0
	move $a1, $s1
	move $a2, $v0
	jal media
	
	move $t5, $v0 
	
	li $v0,  4
	la $a0, string2
	syscall
	li $v0,  1
	move $a0, $t5 
	syscall
	
	li $v0,  10
	syscall
	
media:
	move $t0, $a0
	move $t1, $a1
	move $t2, $a2
	
	add $t0, $t0, $t1
	add $t0, $t0, $t2
	
	li $t1, 3
	div $t0, $t1
	mflo $v0
	jr $ra 