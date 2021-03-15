#Criado por Henrique Alves Pocinho IST199952

.data
vals: .word 3,7,4,6

.text
li   x14,0x10000000
lw   x10,0(x14)
lw   x11,4(x14)
lw   x12,8(x14)
lw   x13,12(x14)
add  x10,x10,x11
add  x10,x10,x12
add  x10,x10,x13
srli x10,x10,2