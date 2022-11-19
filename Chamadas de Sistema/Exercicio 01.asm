# NOME: Caroline Souza Camargo
# 6. Escreva um programa que repetidamente pergunte ao usuário pelo número de
# quilômetros viajados e litros de gasolina consumidos e depois imprima o número de
# quilômetros por litro. Para sair do programa, o usuário deve digitar 0 como número
# de quilômetros.
# Armazene todos os números de quilômetros por litro na memória, iniciando pelo
# endereço 0x10010000.
# Exemplo:
# Entrada 	Saída
# 40
# 3 					13 -- 13 também deve ser armazenado em 0x10010000
# 60
# 5 					12 -- 12 também deve ser armazenado em 0x10010004
# 0 -- Sai do programa

.data
	espacoReservado: .space 80
	string1:  .asciiz "\n\nQuilômetros viajados: "
	string2:  .asciiz "\nLitros de gasolina consumidos: "
	string3:  .asciiz "\nquilômetros por litro:  "
	
.text
	la $s0, espacoReservado
	
	while:
	li $v0, 4
	la $a0, string1
	syscall
	li $v0, 5
	syscall
	move $s1, $v0
	
	beq $s1, $zero, fim
	
	li $v0, 4
	la $a0, string2
	syscall
	li $v0, 5
	syscall
	move $s2, $v0
	
	div $s1, $s2
	mflo $s1
	
	li $v0, 4
	la $a0, string3
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	sw $s1, 0($s0)
	addi $s0, $s0, 4
	
	j while
	fim:
	
	li $v0, 10
	syscall