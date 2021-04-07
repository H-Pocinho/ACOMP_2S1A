.data
a: .word 4
b: .word 7
c: .word 7
d: .word 3

.text
lw a0,a
lw a1,b
lw a2,c
lw a3,d


addi sp,sp,-16
sw a0,12(sp)
sw a1,8(sp)
sw a2,4(sp)
sw a3,0(sp)


lw a1,12(sp)
lw a2,8(sp)
add a0,a2,a1
addi sp,sp,-4
sw a0,0(sp)

lw a1,0(sp)
addi sp,sp,4
lw a2,4(sp)
add a0,a2,a1
addi sp,sp,-4
sw a0,0(sp)

lw a0,0(sp)
addi sp,sp,4
lw a1,0(sp)
sub a0,a0,a1
#Criado por Henrique Alves Pocinho IST199952

addi sp,sp,-4
sw a0,0(sp)

lw a4,0(sp)
lw a3,4(sp)
lw a2,8(sp)
lw a1,12(sp)
lw a0,16(sp)
addi sp,sp,-20

li   x17,10
ecall

#c:
#À entrada de soma3() a pilha contem:
#4
#7
#7
#À entrada de soma() a pilha contem:
#4
#7
#7
#À saida de soma() a pilha contem:
#4
#7
#7
#11
#À saida de soma3() a pilha contem:
#4
#7
#7
#11 (opcional pois o 18 pode ocupar esta posição após o 11 ser lido)
#18