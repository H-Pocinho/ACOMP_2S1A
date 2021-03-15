#Criado por Henrique Alves Pocinho IST199952

.data
a: .byte 3
b: .half 4523
c: .word 100000

.text
lb x10,a
lh x11,b
lw x12,c
add x12,x12,x11
add x12,x12,x10