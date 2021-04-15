.data
a: .word 0
b: .word 0

.text

main:
lw a2,a
lw a3,b
jal rede_neuronal_xor

li x17,1
ecall

li x17,10
ecall


rede_neuronal_xor:
addi sp,sp,-4
sw x1,0(sp)

li a4,2
li a5,-2
li a6,-1
jal neuronio
li a4,-2
li a5,2
mv a7,a0
jal neuronio
li a4,2
mv a2,a7
mv a3,a0
jal neuronio

lw x1,0(sp)
addi sp,sp,4
jalr x0,x1,0


neuronio:
addi sp,sp,-4
sw x1,0(sp)


addi sp,sp,-8
sw a2,4(sp)
sw a4,0(sp)

jal multiplica

lw t6,0(sp)
addi sp,sp,4

addi sp,sp,-8
sw a3,4(sp)
sw a5,0(sp)

jal multiplica

lw t5,0(sp)
addi sp,sp,4

add t0,t5,t6
add t0,t0,a6

lw x1,0(sp)
addi sp,sp,4

bge t0,zero,maior
addi a0,zero,0
jalr x0,x1,0

maior:
addi a0,zero,1
jalr x0,x1,0


multiplica:
lw t0,4(sp)
lw t1,0(sp)
addi sp,sp,8

add t2,zero,zero
add t3,zero,zero

bgt t1,zero,mult
not t1,t1
addi t1,t1,1
addi t3,t3,1
mult:
add t2,t2,t0
addi t1,t1,-1
bgt t1,zero,mult
ble t3,zero,end
not t2,t2
addi t2,t2,1
end:
addi sp,sp,-4
sw t2,0(sp)
jalr x0,x1,0