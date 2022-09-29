# NOME: Caroline Souza Camargo
# 3. Faça um programa que calcule o seguinte polinômio usando o método de Horner:
# y = - ax^4 + bx^3 - cx^2 + dx - e
# Utilize endereços de memória para armazenar o valor de a, b, c, d, e, x e o resultado y. 
# Cada valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space 4). 
# Utilize as sete primeiras posições da memória .data para armazenar, consecutivamente, a, b, c, d, e, x e y, 
# iniciando o código com:
# .data
#   a: .word -3
#   b: .word 7
#   c: .word 5
#   d: .word -2
#   e: .word 8
#   x: .word 4
#   y: .space 4

.data
  a: .word -3
  b: .word 7
  c: .word 5
  d: .word -2
  e: .word 8
  x: .word 4
  y: .space 4

.text
  lui $t0, 0x1001
  lw $t1, 0($t0)	# a
  lw $t2, 4($t0)	# b
  lw $t3, 8($t0)	# c
  lw $t4, 12($t0)	# d
  lw $t5, 16($t0)	# e
  lw $t6, 20($t0)	# x

  sub $t7, $zero, $t1	# -a
  
  mult $t7, $t6		# -a*x
  mflo $t7
  add $t7, $t7, $t2    # (-a*x) + b
  
  mult $t7, $t6		# (-a*x + b)*x
  mflo $t7
  sub $t7, $t7, $t3	# [(-a*x + b)*x] - c
  
  mult $t7, $t6		# [(-a*x + b)*x - c]*x
  mflo $t7
  add $t7, $t7, $t4	# [(-a*x + b)*x - c]*x + d

  mult $t7, $t6		# {[(-a*x + b)*x - c]*x + d}*x
  mflo $t7
  sub $t7, $t7, $t5	# {[(-a*x + b)*x - c]*x + d}*x - e
  
  sw $t7, 24($t0)