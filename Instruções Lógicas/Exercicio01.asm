# NOME: Caroline Souza Camargo
# Faça um programa que escreva o valor 0xDECADA70 no registrador
# $t7, incluindo um dígito hexadecimal por vez (isto é, insira letra por
# letra, individualmente) no registrador.

.data
   a: .word 0xdecada70
   
.text 
  lui $t0, 0x1001
  lw $t7, 0($t0)
  
ori $t7, $zero, 0x000d
sll $t7, $t7, 4

ori $t7, $t7, 0x000e
sll $t7, $t7, 4

ori $t7, $t7, 0x000c
sll $t7, $t7, 4

ori $t7, $t7, 0x000a
sll $t7, $t7, 4

ori $t7, $t7, 0x000d
sll $t7, $t7, 4

ori $t7, $t7, 0x000a
sll $t7, $t7, 4

ori $t7, $t7, 0x0007
sll $t7, $t7, 4

ori $t7, $t7, 0x0000
