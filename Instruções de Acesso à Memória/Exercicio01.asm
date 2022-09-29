# NOME: Caroline Souza Camargo
# 1. Faça um programa que calcule a seguinte equação:
# y = 32ab - 3a + 7b - 13
# Utilize endereços de memória para armazenar o valore de a, b e o resultado y. Cada
# valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space
# 4). Utilize as três primeiras posições da memória .data para armazenar,
# consecutivamente, a, b e y, iniciando o código com:
# .data
#  a: .word 3
#  b: .word 5
#  y: .space 4

.data
  a: .word 3
  b: .word 5
  y: .space 4
  
.text 
  lui $t0, 0x1001
  lw $t1, 0($t0)		# a
  lw $t2, 4($t0)		# b
  
  mult $t1, $t2			# a*b
  mflo $t3	
  	
  addi $t4, $zero, 32		# 32
  mult $t3, $t4			# (a*b)*32
  mflo $t3
  
  addi $t4, $zero, -3		# -3
  mult $t4, $t1			# (-3)*a
  mflo $t4
  
  add $t3, $t3, $t4		# [(a*b)*32] + [(-3)*a]
  
  addi $t4, $zero, 7		# 7
  mult $t4, $t2			# 7*a
  mflo $t4
  
  add $t3, $t3, $t4		# [(a*b)*32 + (-3)*a] + (7*a)
  
  addi $t3, $t3, -13		# [(a*b)*32 + (-3)*a + (7*a)] - 13
  
  sw $t3, 8($t0)
	
  