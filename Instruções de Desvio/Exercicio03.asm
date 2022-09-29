# NOME: Caroline Souza Camargo
# 3. Escreva um programa que leia um valor x > 0 da memória (posição 0x10010000) e
# calcule o x-ésimo termo da série de Fibonacci: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
# Escreva o x-ésimo termo da série (y) em uma palavra (4 bytes) de memória. O
# resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da
# memória .data. Inicie o código com:
# .data
#   x: .word 7
#   y: .space 4

.data
  x: .word 7
  y: .space 4
  
.text
  