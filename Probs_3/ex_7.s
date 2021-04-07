#Criado por Henrique Alves Pocinho IST199952

.data
n: .word 6
adr: .word 0x50

.text
lw x10,n
lw x1,adr

fact:
addi sp,sp,-8
sw	 x1,4(sp) 
sw 	 x10,0(sp) 
addi x5, x10,-1 
bge  x5,x0,Nzer0 
addi x10,x0,1 
addi sp,sp,8
jalr x0,x1,0

Nzer0: 
addi x10,x10,-1 
jal  x1,fact 
addi x11,x10,0 
lw 	 x10,0(sp) 
lw 	 x1,4(sp) 
addi sp,sp,8
mul  x10, x10,x11 
jalr x0,x1,0

li x17,10
ecall
