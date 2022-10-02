# Nome: Caroline Souza Camargo
# Escreva um programa que calcule o produtório abaixo. O valor de n deve ser lido da
# posição 0x10010000 da memória no início do programa. O valor de A deve ser
# escrito na memória no fim do programa, na posição 0x10010004.
# OBS: considere a divisão inteira, i.e.:
# 1 / 2 = 0,
# 2 / 2 = 1,
# 3 / 2 = 1,
# 4 / 2 = 2, etc.

.data 
  n: .word 4
  a: .space 4

.text

main:
  lui $t0, 0x1001
  lw $t1, 0($t0)		# n
  addi $t6, $t1, 1		# n+1
  
  addi $t2, $zero, 0		# i
  addi $t4, $zero, 2		# 2
  addi $t5, $zero, 1		# a = 1
    
while:
  slt $t3, $t2, $t6		# i <= n
  beq $t3, $zero, acabou
  
  div $t2, $t4			# i / 2
  mflo $t3
  
  add $t3, $t3, $t1		# (i / 2) + n
  mult $t3, $t5			# (i/2 + n) * a
  mflo $t5
  
  addi $t2, $t2, 1		# i + 1
  j while
  
acabou: 
  sw $t5, 4($t0)
  