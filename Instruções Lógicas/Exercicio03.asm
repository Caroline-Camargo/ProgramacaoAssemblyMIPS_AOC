# NOME: Caroline Souza Camargo
# 3. Comece um programa pela instrução: ori $t1, $zero, 0x01. Usando
# apenas as instruções lógicas do tipo R (dois registradores como
# operandos) or, and e xor e instruções de shift (isto é, sem usar outras
# instruções ori além da inicial e nem instruções nor),
# escreva 0xFFFFFFFF em $t1. Procure usar o menor número de
# instruções possível.

ori $t1, $zero, 0x1	#0000 0000 0000 0000 0000 0000 0000 0001 -> $t1

sll $t2, $t1, 1		#0000 0000 0000 0000 0000 0000 0000 0010 -> $t2
or $t1, $t2, $t1	#0000 0000 0000 0000 0000 0000 0000 0011 -> $t1

sll $t2, $t1, 2		#0000 0000 0000 0000 0000 0000 0000 1100 -> $t2
or $t1, $t2, $t1	#0000 0000 0000 0000 0000 0000 0000 1111 -> $t1
  
sll $t2, $t1, 4		#0000 0000 0000 0000 0000 0000 1111 0000 -> $t2
or $t1, $t2, $t1	#0000 0000 0000 0000 0000 0000 1111 1111 -> $t1

sll $t2, $t1, 8		#0000 0000 0000 0000 1111 1111 0000 0000 -> $t2
or $t1, $t2, $t1	#0000 0000 0000 0000 1111 1111 1111 1111 -> $t1

sll $t2, $t1, 16	#1111 1111 1111 1111 0000 0000 0000 0000 -> $t2
or $t1, $t2, $t1	#1111 1111 1111 1111 1111 1111 1111 1111 -> $t1

