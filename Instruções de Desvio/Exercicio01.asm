# NOME: Caroline Souza Camargo
# 1. Escreva um programa que leia dois halfwords (a e b) da memória e calcule a sua
# divisão se os dois valores forem diferentes e a sua multiplicação se os dois valores
# forem iguais. Escreva o resultado (y) em uma palavra (4 bytes) de memória. O
# resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da
# memória .data. Inicie o código com:
# .data
#   a: .half 30
#   b: .half 5
#   y: .space 4

.data
  a: .half 30
  b: .half 5
  y: .space 4
  
.text 
  