# NOME: Caroline Souza Camargo
# 2. Escreva 0xAAAAAAAA em $t1. Faça um shift de um bit para a direita
# desse valor e coloque o resultado em $t2, deixando $t1 inalterado. Em
# $t3, $t4 e $t5 coloque os resultados das operações or, and e xor entre
# $t1 e $t2, respectivamente. Em comentários no final do código, explique
# os resultados obtidos, mostrando os valores binários.

ori $t1, $zero, 0xaaaa   	#0000 0000 0000 0000 1010 1010 1010 1010 -> $t1
sll $t1, $t1, 16		#1010 1010 1010 1010 0000 0000 0000 0000 -> $t1
ori $t1, $t1, 0xaaaa		#1010 1010 1010 1010 1010 1010 1010 1010 -> $t1

srl $t2, $t1, 1			#0101 0101 0101 0101 0101 0101 0101 0101 -> $t2	0101 -> 5 (hexadecimal)

or $t3, $t1, $t2		#1010 1010 1010 1010 1010 1010 1010 1010 -> $t1
				#0101 0101 0101 0101 0101 0101 0101 0100 -> $t2
				#1111 1111 1111 1111 1111 1111 1111 1111 -> $t3	1111 -> f (hexadecimal)
				
and $t4, $t1, $t2		#1010 1010 1010 1010 1010 1010 1010 1010 -> $t1
				#0101 0101 0101 0101 0101 0101 0101 0100 -> $t2
				#0000 0000 0000 0000 0000 0000 0000 0000 -> $t3	0000 -> 0 (hexadecimal)
				
xor $t5, $t1, $t2		#1010 1010 1010 1010 1010 1010 1010 1010 -> $t1
				#0101 0101 0101 0101 0101 0101 0101 0100 -> $t2
				#1111 1111 1111 1111 1111 1111 1111 1111 -> $t3	1111 -> f (hexadecimal)