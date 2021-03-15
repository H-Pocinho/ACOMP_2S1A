#Criado por Henrique Alves Pocinho IST199952

.data
a: .word 3
b: .word 7
c: .word 4
d: .word 0

.text
li   x14,0x10000000
lw   x10,a
lw   x11,b
lw   x12,c
add  x13,x11,x10
sub  x13,x13,x12
slli x12,x12,1
add  x13,x13,x12
sw   x13,12(x14)