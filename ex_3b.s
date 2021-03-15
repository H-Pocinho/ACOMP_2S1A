#Criado por Henrique Alves Pocinho IST199952

.data
vals: .word 3,7,4,6
vacc: .word 0,0,0,0

.text
li x10,0x10000000
lw x11,0(x10)
add x12,x0,x11
sw x12,16(x10)
lw x11,4(x10)
add x12,x12,x11
sw x12,20(x10)
lw x11,8(x10)
add x12,x12,x11
sw x12,24(x10)
lw x11,12(x10)
add x12,x12,x11
sw x12,28(x10)