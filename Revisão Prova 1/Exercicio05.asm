# NOME: Caroline Souza Camargo
# 5. Escreva um programa que receba dois números em complemento de dois
# (armazenados em $s0 e $s1). Procure em um vetor (com início endereçado em $s3 e
# tamanho armazenado em $s4) quantos números existem com valores dentro do
# intervalo fechado definido por $s0 e $s1. Assuma que $s0 ≤ $s1.
# Utilize os registradores $s3 e $s4 apenas para armazenar o início e o tamanho do vetor

.data
  num1: .word 1
  num2: .word 2
  ini: .space 4			# [0] -> apartir desse endereço
  tam: .word 8			# [1]
  
  a: .word 1			# [2]
  b: .word 3			# [3]
  c: .word 2			# [4]
  d: .word -3			# [5]
.text

main:
  lui $t0, 0x1001
  lw $s0, 0($t0)		# num1
  lw $s1, 4($t0)		# num2
  addi $s3, $t0, 8		# inicio
  lw $s4, 12($t0)		# tamanho
  
  addi $t1, $zero, 1		# i = 1
  addi $s1, $s1, 1		# num2 + 1
  addi $s4, $s4, 1		# tamanho + 1
  
while:
  slt $t2, $t1, $s4		# i <= tamanho
  beq $t2, $zero, fim
  
  lw $t3, 0($s3)		# vet[i]
  
  if:
    slt $t2, $t3, $s1		# vet[i] <= num2
    beq $t2, $zero, else
    slt $t2, $t3, $s0		# vet[i] < num1
    bne $t2, $zero, else
    addi $s2, $s2, 1		# cont++

  else:   
    addi $s3, $s3, 4		# próxima região de memória
    addi $t1, $t1, 1		# i++
  j while
  
fim:
  