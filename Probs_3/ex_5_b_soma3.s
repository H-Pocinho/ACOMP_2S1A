.data
a: .word 10
b: .word 5
c: .word 1

#Criado por Henrique Alves Pocinho IST199952

.text
lw a0,a
lw a1,b
lw a2,c

addi sp,sp,-12
sw a0,8(sp)
sw a1,4(sp)
sw a2,0(sp)

lw a1,8(sp)
lw a2,4(sp)
add a0,a2,a1
addi sp,sp,-4
sw a0,0(sp)

lw a1,0(sp)
addi sp,sp,4
lw a2,0(sp)
add a0,a2,a1
addi sp,sp,-4
sw a0,0(sp)


lw a3,0(sp)
lw a2,4(sp)
lw a1,8(sp)
lw a0,12(sp)
addi sp,sp,16

li   x17,10
ecall
