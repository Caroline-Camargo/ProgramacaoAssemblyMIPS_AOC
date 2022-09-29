# NOME: Caroline Souza Camargo
# 10. Faça um programa que calcule a área do triângulo equilátero abaixo e escreva o
# resultado em $t3. Armazene b em $t1 e h em $t2 utilizando as instruções addi $t1, $zero, b e
# addi $t2, $zero, h, substituindo b e h pelos valores desejados, e sempre que precisar
# de b e h, utilize os valores armazenados nos registradores $t1 e $t2
# b: base/lado     h: altura    a = (b * h) / 2

addi $t1, $zero, 120	# b
addi $t2, $zero, 160	# h

mult $t1, $t2 		# b*h
mflo $t3

addiu $t4, $zero, 2	# 2
div $t3, $t4		# (b*h) / 2
mflo $t3
