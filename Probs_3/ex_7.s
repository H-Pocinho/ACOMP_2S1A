#Criado por Henrique Alves Pocinho IST199952

.text
li x10,6
li x1,0x48

fact:
addi sp,sp,-8
sw	 x1,4(sp) 
sw 	 x10,0(sp) 
addi x5, x10,-1 
bge  x5,x0,L1 
addi x10,x0,1 
addi sp,sp,8
jalr x0,x1,0

L1: 
addi x10,x10,-1 
jal  x1,fact 
addi x6,x10,0 
lw 	 x10,0(sp) 
lw 	 x1,4(sp) 
addi sp,sp,8
mul  x10, x10,x6 
jalr x0,x1,0

li x17,10
ecall