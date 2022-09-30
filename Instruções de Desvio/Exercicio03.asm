# NOME: Caroline Souza Camargo
# 3. Escreva um programa que leia um valor x > 0 da memória (posição 0x10010000) e
# calcule o x-ésimo termo da série de Fibonacci: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
# Escreva o x-ésimo termo da série (y) em uma palavra (4 bytes) de memória. O
# resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da
# memória .data. Inicie o código com:
# .data
#   x: .word 7
#   y: .space 4

.data
  x: .word 7
  y: .space 4
  
.text

main:
  lui $t0, 0x1001
  lw $t1, 0($t0)		# x
  
  addiu $t2, $zero, 1		# valor
  addiu $t3, $zero, 0		# valor[x-1]
  addiu $t4, $zero, 0		# valor[x-2]  
  addiu $t5, $zero, 1		# i 
  
while:
  slt $t6, $t5, $t1		# i < x 
  beq $t5, $t1 achou
  addiu $t5, $t5, 1		# i = i + 1
  addu $t4, $zero, $t3		# valor[x-2] = valor[x-1]
  addu $t3, $zero, $t2		# valor[x-1] = valor
  addu $t2, $t3, $t4		# valor = valor[x-1] + valor[x-2]
  j while
  
achou: 
  sw $t2, 4($t0)
