.text
li x10,4
li x11,50
addi sp,sp,-8
sw x10,4(sp)
sw x11,0(sp)
lw x10,0(sp)
lw x11,4(sp)
addi sp,sp,8

li   x17,10
ecall