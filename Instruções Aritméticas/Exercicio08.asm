# NOME: Caroline Souza Camargo
# 8. Faça um programa que calcule a seguinte equação: y = 3x^2 - 5x + 13
# Armazene x no registrador $t5 com a instrução addi $t5, $zero, x, substituindo x pelo
# valor desejado, e sempre que precisar o valor de x, utilize o valor armazenado no registrador $t5.
# Armazene o resultado y no registrador $t6.
# Faça teste com diferentes valores positivos e negativos de x.
# Faça um teste substituindo a primeira instrução addi por uma instrução ori
# equivalente e responda, nos comentários, qual o resultado quando são usados números
# positivos e números negativos.

addi $t5, $zero, -2	# x

mult $t5, $t5		# x*x
mflo $t6

addi $t2, $zero, 3	# 3
mult $t6, $t2		# (x*x)3
mflo $t6

addi $t2, $zero, -5	# -5
mult $t5, $t2		# x*(-5)
mflo $t2

add $t6, $t6, $t2	# [(x*x)3] + [x*(-5)]

addi $t6, $t6, 13	# [(x*x)3 + x*(-5)] + 13


# ORI é uma instrução lógica, dessa forma não aceita número com sinal
