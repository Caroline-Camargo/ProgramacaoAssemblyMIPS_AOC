# NOME: Caroline Souza Camargo
# 7. Escreva um programa que calcule o valor de
# 4x - 2y + 3z (armazene os valores de x, y e z em $t1, $t2 e $t3,
# respectivamente) e coloque o resultado em $t7. Faça testes com alguns
# valores diferentes de x, y e z. Utilize apenas instruções já vistas na
# disciplina

addi $t1, $zero, 5	# x
addi $t2, $zero, 7	# y
addi $t3, $zero, 3	# z

sll $t4, $t1, 2		# x*4
sll $t5, $t2, 1		# y*2
sub $t7, $t4, $t5	# x*4 - y*2

addi $t4, $zero, 3	# 3
mult $t4, $t3		# z*3
mflo $t5

add $t7, $t7, $t5	# (x*4 - y*2) + z*3