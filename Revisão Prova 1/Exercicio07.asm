# Exercício Extra 
.data 
  op: .word 2			# 0 -> volume   1 -> calcular expressão F=6a-2b+c   3 -> inverter os bits ímpares de C
  a: .word 2
  b: .word 3
  c: .word 7
  y: .space 4
  
.text

main: 
  lui $t0, 0x1001
  lw $t7, 0($t0)		# op
  lw $t1, 4($t0)		# a
  lw $t2, 8($t0)		# b
  lw $t3, 12($t0)		# c
  
  beq $t7, $zero, volume
  
  addi $t4, $zero, 1		# temp = 1
  beq $t7, $t4, expressao
  
  addi $t4, $zero, 2		# temp = 2
  beq $t7, $t4, inverter

volume:
  mult $t1, $t2			# a*b
  mflo $t4
  mult $t4, $t3			# (a*b)*c
  mflo $t4
  j fim
  
expressao:  # F = 6a - 2b + c
  sll $t4, $t1, 2 		# a*4
  add $t4, $t4, $t1		# a*4 + a
  add $t4, $t4, $t1		# a*5 + a
  
  sll $t5, $t2, 1		# b*2
  sub $t4, $t4, $t5		# 6a - 2b
  
  add $t4, $t4, $t3 		# 6a - 2b + c
  j fim
  
inverter:
  ori $s0,$zero,0x0101
  sll $s0,$s0,16
  ori $s0,$s0,0x0F0F
  xor $t4,$s0,$t3

fim:
  sw $t4, 16($t0)