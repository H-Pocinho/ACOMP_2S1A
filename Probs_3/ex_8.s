#Criado por Henrique Alves Pocinho IST199952

.data
x: .word 3
n: .word 5
i: .word 1
y: .word 1

.text
lw x10,i
lw x11,y
lw x12,n
lw x13,x
add x10,zero,zero

for:
ble x12,x10,end
addi sp,sp,-20
sw x10,16(sp)
sw x11,12(sp)
sw x12,8(sp)
sw x13,4(sp)

lw x10,12(sp)
lw x11,4(sp)
mul x11,x11,x10
sw x11,12(sp)

lw x13,4(sp)
lw x12,8(sp)
lw x11,12(sp)
lw x10,16(sp)
addi x10,x10,1
j for

end:

li   x17,10
ecall