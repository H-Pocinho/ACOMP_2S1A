#Criado por Henrique Alves Pocinho IST199952

.data
a: .word 3
b: .word 15
c: .word 4
d: .word 0

.text
lw   x10,a
lw   x11,b
lw   x12,c
slli x13,x10,7
srli x11,x11,2
slli x12,x12,3
add  x13,x13,x11
add  x13,x13,x12
sw   x13,12(x14)