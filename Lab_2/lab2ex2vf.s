.text

main:
li a0, 0
li a1, 0
li a2, 0
jal y
li x17, 1
ecall

li a0, 0
li a1, 0
li a2, 1
jal y
li x17, 1
ecall

li a0, 0
li a1, 1
li a2, 0
jal y
li x17, 1
ecall

li a0, 0
li a1, 1
li a2, 1
jal y
li x17, 1
ecall

li a0, 1
li a1, 0
li a2, 0
jal y
li x17, 1
ecall

li a0, 1
li a1, 0
li a2, 1
jal y
li x17, 1
ecall

li a0, 1
li a1, 1
li a2, 0
jal y
li x17, 1
ecall

li a0, 1
li a1, 1
li a2, 1
jal y
li x17, 1
ecall

li x17,10
ecall


y:
addi sp,sp,-4
sw x1,0(sp)
mv t0,a0
mv t1,a1
mv t2,a2

mv a2,t0		#x1
mv a3,t1		#x2
li a4,2			#w1
li a5,-2		#w2
li a6,-1		#b
jal neuronio
li a4,-2
li a5,2
mv a7,a0
jal neuronio
li a4,2
mv a2,a7
mv a3,a0
jal neuronio
mv a7,a0
mv a2,t0		
mv a3,t2	
jal neuronio
mv a2,a7	
mv a3,a0
li a5,-2
jal neuronio



lw x1,0(sp)
addi sp,sp,4
jalr x0,x1,0


neuronio:
addi sp,sp,-16
sw t2,12(sp)
sw t1,8(sp)
sw t0,4(sp)
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




bge t0,zero,maior
lw x1,0(sp)
lw t0,4(sp)
lw t1,8(sp)
lw t2,12(sp)
addi sp,sp,16
addi a0,zero,0
jalr x0,x1,0

maior:
lw x1,0(sp)
lw t0,4(sp)
lw t1,8(sp)
lw t2,12(sp)
addi sp,sp,16
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