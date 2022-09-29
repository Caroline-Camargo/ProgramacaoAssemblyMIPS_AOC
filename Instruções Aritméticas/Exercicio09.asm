# NOME: Caroline Souza Camargo
# Faça um programa que calcule a seguinte equação: y = (9x + 7) / (2x + 8)
# Armazene x em $t1, com a instrução addi $t1, $zero, x, substituindo x pelo valor
# desejado, e sempre que precisar o valor de x, utilize o valor armazenado no
# registrador $t1.
# Armazene o quociente da divisão em $t2 e o resto em $t3.
# Responda o que acontece quando x = -4.

addi $t1, $zero, -4	# x

addi $t4, $zero, 9	# 9
mult $t4, $t1		# x*9
mflo $t4
addi $t4, $t4, 7	# (x*9) + 7

sll $t5, $t1, 1		# x*2
addi $t5, $t5, 8	# (x*2) + 8

div $t4, $t5		# [(x*9) + 7] / [(x*2) + 8]
mflo $t2
mfhi $t3

# Quando o x é igual 4 o denominado fica igual 0 
# Dessa forma, como não existe divisão por zero o resultado dessa divisão não vai para o HI nem para o LO
# Ou seja, acaba salvando nos registradores os dados da divisão anterior