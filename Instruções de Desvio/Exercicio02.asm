# NOME: Caroline Souza Camargo
# 2. Escreva um programa que calcule: 1 + 2 + 3 + … + 333
# Escreva o resultado (y) em uma palavra (4 bytes) de memória. O resultado deve ser
# armazenado, obrigatoriamente, na posição 0x10010000 da memória .data. Inicie o código com:
# .data
#   y: .space 4

.data
  y: .space 4
  
.text 

main:
  lui $t0, 0x1001
  
  addiu $t1, $zero, 0		# y = 0
  addiu $t2, $zero, 1		# i = 0
  
compara:
  slti $t3, $t2, 334		# i <= 333
  beq $t3, $zero, acabou	# temp == 0
  addu $t1, $t1, $t2		# y = y + i
  addiu $t2, $t2, 1		# i = i + 1
  j compara
 
acabou:
  sw $t1, 0($t0)
  
