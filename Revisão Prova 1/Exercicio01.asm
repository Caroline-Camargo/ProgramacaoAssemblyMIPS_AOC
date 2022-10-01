# NOME: Caroline Souza Camargo
# 1. Reescreva o seguinte código C em MIPS Assembly:
# int i;
# int vetor[8];
# for(i=0; i<8; i++) {
#   if(i%2==0)
#   vetor[i] = i * 2;
#   else
#   vetor[i] = vetor[i] + vetor[i-1];
# }
# Cada posição do vetor deve ter 4 bytes e deve ser armazenada, em sequência, a
# partir da posição 0x1001000 da memória.

.data
  vetor: .space 32
  
.text

main:
  lui $t0, 0x1001
  addi $t1, $zero, 0		# i = 0
  addi $t3, $zero, 2		# temp = 2

while:
  slti $t2, $t1, 8		# i < 8
  beq $t2, $zero, fim
  
if:
  div $t1, $t3			# i / 2
  mfhi $t2
  bne $t2, $zero, else		# (i%2) == 0
  
  mult $t3, $t1			# i * 2
  mflo $t6			
  sw $t6, 0($t0)
  j prox
     
else: 
  lw $t6, 0($t0)		# vetor[i]
  lw $t7, -4($t0)		# vetor[i-1]
  add $t6, $t6, $t7		# vetor[i] + vetor[i-1]
  sw $t6, 0($t0)

prox:
  addi $t0, $t0, 4		# vetor[i+1]
  addi $t1, $t1, 1		# i = i + 1
  j while
  
fim:
  