# NOME: Caroline Souza Camargo
# 4. Escreva um programa que calcule o fatorial de n.
# O valor de n deve ser lido da memória na posição 0x10010000 e o valor de n! deve
# ser escrito na posição seguinte na memória (0x10010004).

.data
  n: .word 10
  fat: .space 4

.text

main:
  lui $t0, 0x1001
  lw $t1, 0($t0)		# n
  addi $t2, $t2, 1		# fat
    
while:
  beq $t1, $zero, fim		# n == 0 
  
  mult $t1, $t2			# fat * n
  mflo $t2
  
  addi $t1, $t1, -1		# n--
  j while

fim:
  sw $t2, 4($t0)