# NOME: Caroline Souza Camargo
# 4. Uma temperatura, armazenada em $t0, pode ficar em dois intervalos:
# 20 ≤ temp ≤ 40 e 60 ≤ temp ≤ 80.
# Escreva um programa que coloque uma flag (registrador $t1) para 1 se a
# temperatura está entre os valores permitidos e para 0 caso contrário.
# Inicie o código com a instrução: ori $t0, $zero, temperatura, substituindo
# temperatura por um valor qualquer.

main: 
  ori $t0, $zero, 35			# t = temperatura
  
  slti $t1, $t0, 20			# t < 20  
  bne $t1, $zero, foraDoIntervalo	
  
  slti $t1, $t0, 41			# t <= 40 
  bne $t1, $zero, dentroDoIntervalo	
  
  slti $t1, $t0, 60			# t < 60 
  bne $t1, $zero, foraDoIntervalo
  
  slti $t1, $t0, 81			# t <= 80 
  bne $t1, $zero, dentroDoIntervalo
  
foraDoIntervalo:
  ori $t1, $zero, 0			# flag = 0
  j fim
  
dentroDoIntervalo:
  ori $t1, $zero, 1			# flag = 1

fim:
 