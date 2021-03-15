#Criado por Henrique Alves Pocinho IST199952

.data
x: .word 5
y: .word 0

.text
lw   x11,x
li 	 x13,0x10000000
addi x10,x10,7
add x10,x11,x10
slli x12,x11,2
add x10,x10,x12
mul x12,x11,x11
slli x12,x12,1
sub x10,x10,x12
mul x12,x11,x11
mul x12,x12,x11
add x10,x10,x12
slli x12,x12,1
add x10,x10,x12
sw x10,4(x13)