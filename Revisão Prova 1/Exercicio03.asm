# NOME: Caroline Souza Camargo
# 3. Escreva um programa que encontre a mediana de três valores lidos da memória. A
# mediana deve ser salva na posição 0x1001000C da memória.

.data
  a: .word 19
  b: .word 9
  c: .word 6
  y: .space 4

.text

main:
  lui $t0, 0x1001
  lw $t1, 0($t0)		# a
  lw $t2, 4($t0)		# b
  lw $t3, 8($t0)		# c
  
  slt $t4, $t1, $t2		# a < b
  beq $t4, $zero, teste1
  
  slt $t4, $t3, $t1		# c < a   
  beq $t4, $zero, teste2
  j medianaA			# já sabemos: c < a < b 
 
teste1:				# já sabemos: b < a
  slt $t4, $t3, $t2		# c < b 
  beq $t4, $zero, teste3
  j medianaB 			# já sabemos: c < b < a 

teste2: 			# já sabemos: a < b e a < c
  slt $t4, $t2, $t3		# b < c
  beq $t4, $zero, medianaC
  j medianaB
    
teste3:				# já sabemos: b < a e  b < c  
  slt $t4, $t1, $t3		# a < c 
  beq $t4, $zero, medianaC
  j medianaA       
 
medianaA:
  sw $t1, 12($t0)
  j fim
  
medianaB:
  sw $t2, 12($t0)
  j fim
  
medianaC:
  sw $t3, 12($t0)

fim: