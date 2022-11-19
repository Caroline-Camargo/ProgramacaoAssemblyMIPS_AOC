# NOME: Caroline Souza Camargo
# 8. Escreva um programa equivalente ao código C abaixo com o assembly do MIPS.
# Assim como no exemplo em C, utilize duas subrotinas (soma3n e soma). Armazene
# os valores em $t0, $t1, $t2 e $t3, para X, Y, Z e R, respectivamente.
# main(){
# int X=150;
# int Y=230;
# int Z=991;
# int R=0;
# R = soma3n(X, Y, Z);
# }
# int soma3n(int n1, int n2, int n3){
# return( soma(n3, soma(n1, n2)));
# }
# int soma(int A, int B){
# return( A+B );
# }

.data
X: .word 150
Y: .word  230
Z: .word  991
R: .word 0

.text
main:
	lw $s0, X
	lw $s1, Y
	lw $s2, Z
	
	move $a0, $s0
	move $a1 $s1
	move $a2, $s2
	
	jal soma3n
	move $t3, $v0
	sw $t3, R
	
	li $v0, 10
	syscall

soma3n:
	move $t2, $a2
	
	addiu $sp, $sp, -4
	sw $t2, 0($sp)
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal soma
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	lw $t2, 0($sp)
	addiu $sp, $sp, 4
	
	move $t0, $v0
	add $t0, $t0, $t2
	
	move $v0, $t0
	jr $ra
	
	
soma:
	move $t0, $a0
	move $t1, $a1
	
	add $t0, $t0, $t1
	move $v0, $t0
	jr $ra
	
