#Criado por Henrique Alves Pocinho IST199952

.data
a: .word 0xcde8

.text
lw x10,a
lw x11,a

main:
srli x11,x11,1
slli x11,x11,1
beq x10,x0,end
beq x10,x11,zer0 
bne x10,x11,um


zer0:
srli x11,x11,1
srli x10,x10,1
jal main

um:
srli x11,x11,1
srli x10,x10,1
addi x13,x13,1
jal main

end: