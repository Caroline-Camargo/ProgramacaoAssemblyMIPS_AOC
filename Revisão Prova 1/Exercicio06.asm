# NOME: Caroline Souza Camargo
# 6. Escreva um programa que calcule o número de bits significativos de um número
# inteiro positivo. Inicie o programa com a instrução ori $t1, $0, x, substituindo x pelo
# valor desejado. Armazene o resultado final no registrador $t2

main:
  ori $t1, $0, 0xFF00		# 0000 0000 0000 0000 1111 1111 0000 0000
  				# bits significativos: 16
  
while:
  beq $t1, $zero, fim		# num == 0
  srl $t1, $t1, 1		# Desloca de um em um bit para direita, até ficar apenas com o número 0
  addi $t2, $t2, 1		# cont++
  j while
  
fim: