.data
a: .word 0
b: .word 1

.text

rede_neuronal_xor:
lw a2,a
lw a3,b
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

li x17,1
ecall

li   x17,10
ecall


neuronio:

addi sp,sp,-28
sw x1,24(sp)
sw a2,20(sp)
sw a3,16(sp)
sw a4,12(sp)
sw a5,8(sp)
sw a6,4(sp)
sw a7,0(sp)


jal multiplica

lw t3,0(sp)
lw a7,4(sp)
lw a6,8(sp)
lw a5,12(sp)
lw a4,16(sp)
lw a3,20(sp)
lw a2,24(sp)
lw x1,28(sp)
addi sp,sp,32

addi sp,sp,-28
sw x1,24(sp)
sw a2,16(sp)
sw a3,20(sp)
sw a4,8(sp)
sw a5,12(sp)
sw a6,4(sp)
sw a7,0(sp)

jal multiplica

lw t4,0(sp)
lw a7,4(sp)
lw a6,8(sp)
lw a5,16(sp)
lw a4,12(sp)
lw a3,24(sp)
lw a2,20(sp)
lw x1,28(sp)
addi sp,sp,32

add t0,t3,t4
add t0,t0,a6

bge t0,zero,maior
addi a0,zero,0
jalr x0,x1,0

maior:
addi a0,zero,1
jalr x0,x1,0


multiplica:
lw t0,20(sp)
lw t1,12(sp)
add t2,zero,zero
add t5,zero,zero

bgt t1,zero,mult
not t1,t1
addi t1,t1,1
addi t5,t5,1
mult:
add t2,t2,t0
addi t1,t1,-1
bgt t1,zero,mult
ble t5,zero,end
not t2,t2
addi t2,t2,1
end:
addi sp,sp,-4
sw t2,0(sp)
jalr x0,x1,0



#versão optimizada

.data
a: .word 0
b: .word 1

.text

rede_neuronal_xor:
lw a2,a
lw a3,b
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

li x17,1
ecall

li   x17,10
ecall


neuronio:

addi sp,sp,-28
sw x1,24(sp)
sw a2,20(sp)
sw a3,16(sp)
sw a4,12(sp)
sw a5,8(sp)
sw a6,4(sp)
sw a7,0(sp)


jal multiplica

lw t3,0(sp)
lw a7,4(sp)
lw a6,8(sp)
lw a5,12(sp)
lw a4,16(sp)
lw a3,20(sp)
lw a2,24(sp)
lw x1,28(sp)
addi sp,sp,32

addi sp,sp,-28
sw x1,24(sp)
sw a2,16(sp)
sw a3,20(sp)
sw a4,8(sp)
sw a5,12(sp)
sw a6,4(sp)
sw a7,0(sp)

jal multiplica

lw t4,0(sp)
lw a7,4(sp)
lw a6,8(sp)
lw a5,16(sp)
lw a4,12(sp)
lw a3,24(sp)
lw a2,20(sp)
lw x1,28(sp)
addi sp,sp,32

add t0,t3,t4
add t0,t0,a6

bge t0,zero,maior
addi a0,zero,0
jalr x0,x1,0

maior:
addi a0,zero,1
jalr x0,x1,0


multiplica:
lw t0,20(sp)
lw t1,12(sp)
add t2,zero,zero
add t5,zero,zero

beq t0,zero,end
add t2,t1,zero

end:
addi sp,sp,-4
sw t2,0(sp)
jalr x0,x1,0




#v3 (provavelmente a mais completa)
.data
a: .word 0
b: .word 0

.text

rede_neuronal_xor:
lw a2,a
lw a3,b
li a4,2
li a5,-2
li a6,-1
jal neuronio
li a4,-2
li a5,2
mv a7,a0 			#c
jal neuronio
li a4,2
mv a2,a7			#c
mv a3,a0			#d
jal neuronio		#y

li x17,1
ecall

li   x17,10
ecall


neuronio:
mv t6,x1

jal multiplica
mv t4,t3

mv t0,a3
mv t1,a2
mv a2,t0
mv a3,t1
add t0,x0,x0
add t1,x0,x0

mv t0,a5
mv t1,a4
mv a4,t0
mv a5,t1
add t0,x0,x0
add t1,x0,x0

jal multiplica

mv t0,a3
mv t1,a2
mv a2,t0
mv a3,t1
add t0,x0,x0
add t1,x0,x0

mv t0,a5
mv t1,a4
mv a4,t0
mv a5,t1
add t0,x0,x0
add t1,x0,x0

add t0,t3,t4
add t0,t0,a6


mv x1,t6

bge t0,zero,maior
addi a0,zero,0
jalr x0,x1,0

maior:
addi a0,zero,1
jalr x0,x1,0


multiplica:

addi sp,sp,-36
sw t4,32(sp)
sw t6,28(sp)  #return do neuronio
sw x1,24(sp)	#return adress
sw a2,20(sp)	#a
sw a3,16(sp)	#b
sw a4,12(sp)	#w1
sw a5,8(sp)	#w2
sw a6,4(sp)	#b do neuronio
sw a7,0(sp)	#c



lw t0,20(sp)		#x
lw t1,12(sp)		#w
add t2,zero,zero	
add t5,zero,zero

bgt t1,zero,mult
not t1,t1
addi t1,t1,1
addi t5,t5,1
mult:
add t2,t2,t0
addi t1,t1,-1
bgt t1,zero,mult
ble t5,zero,end
not t2,t2
addi t2,t2,1
end:
addi sp,sp,-4
sw t2,0(sp)

lw t3,0(sp)
lw a7,4(sp)
lw a6,8(sp)
lw a5,12(sp)
lw a4,16(sp)
lw a3,20(sp)
lw a2,24(sp)
lw x1,28(sp)
lw t6,32(sp)
lw t4,36(sp)
addi sp,sp,40

jalr x0,x1,0
