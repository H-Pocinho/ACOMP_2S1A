.data
a: .word 10
b: .word 5


.text
lw a0,a
lw a1,b


addi sp,sp,-8
sw a0,4(sp)
sw a1,0(sp)

lw a1,4(sp)
lw a0,0(sp)
sub a0,a0,a1
addi sp,sp,-4
sw a0,0(sp)


lw a2,0(sp)
lw a1,4(sp)
lw a0,8(sp)
addi sp,sp,-12

li   x17,10
ecall