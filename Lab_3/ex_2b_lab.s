
.data
	n: .word 20

.text


	lw a0, n
	addi sp,sp,-4
	sw a0,0(sp)
	jal funU
	lw a0,0(sp)
	addi sp,sp,4

	
	li a7, 1
	ecall

	li a7, 10
	ecall

funU:
	addi sp, sp, -4
	sw ra, 0(sp)
	li t6,1

	lw t0,4(sp) #n
	
	bgt t0,t6,Num
	addi sp,sp,4
	sw t6,0(sp)
	
	ret

Num:
	li t3,2
	srli t2,t0,1
	rem t3,t0,t3
	beq t3,zero,par

impar:
	addi sp,sp,-4
	sw t2,0(sp)

	jal funU

	lw t4,0(sp)
	li t1,2

	addi sp, sp, -8
	sw t4, 4(sp)
	sw t1, 0(sp)
	jal Mult
	lw t4, 0(sp)
	addi sp, sp, 4

	addi t4,t4,7

	lw ra,4(sp)
	addi sp,sp,8
	sw t4,0(sp)

	ret
	

par:
	addi sp,sp,-4
	sw t2,0(sp)

	jal funU

	lw t4,0(sp)

	addi sp, sp, -8
	sw t4, 4(sp)
	sw t4, 0(sp)
	jal Mult
	lw t4, 0(sp)
	addi sp, sp, 4

	lw ra,4(sp)
	addi sp,sp,8
	sw t4,0(sp)

	ret



Mult:
	addi sp, sp, -12
	sw s1, 8(sp)
	sw s2, 4(sp)
	sw s3, 0(sp)

	lw s2, 16(sp)
	lw s1, 12(sp)

	li s3, 0
	beq s2, zero, OutMul
	beq s1, zero, OutMul

MulLoop:
	add s3, s3, s1
	addi, s2, s2, -1
	bne s2, zero, MulLoop

OutMul:
	sw s3, 16(sp)

	lw s3, 0(sp)
	lw s2, 4(sp)
	lw s1, 8(sp)
	addi sp, sp, 16
	ret