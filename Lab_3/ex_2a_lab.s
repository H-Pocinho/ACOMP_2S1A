# ZONA I: Definicao de variaveis
.data
	x: .word 3
	y: .word 9

# ZONA II: Codigo
.text


	lw a0, x
	lw a1, y
	addi sp,sp,-12
	sw a0,4(sp)
	sw a1,0(sp)
	jal Pow
	lw a0,0(sp)
	addi sp,sp,4

	
	li a7, 1
	ecall

	li a7, 10
	ecall

Pow:
	addi sp, sp, -4
	sw ra, 0(sp)
	li t6,1

	lw t0,8(sp) #x
	lw t1,4(sp) #y
	
	bgt t1,zero,Nzero
	addi sp,sp,8
	sw t6,0(sp)
	
	ret

Nzero:
	li t3,2
	srli t2,t1,1
	rem t3,t1,t3
	beq t3,zero,par

impar:
	addi sp,sp,-12
	sw t0,4(sp) #x
	sw t2,0(sp) #y

	jal Pow

	lw t4,0(sp)

	addi sp, sp, -8
	sw t4, 4(sp)
	sw t4, 0(sp)
	jal Mult
	lw s1, 0(sp)
	addi sp, sp, 4

	addi sp, sp, -8
	sw t0, 4(sp)
	sw s1, 0(sp)
	jal Mult
	lw t4, 0(sp)
	addi sp, sp, 4

	lw ra,8(sp)
	addi sp,sp,16
	sw t4,0(sp)

	ret
	

par:
	addi sp,sp,-12
	sw t0,4(sp) #x
	sw t2,0(sp) #y

	jal Pow

	lw t4,0(sp)

	addi sp, sp, -8
	sw t4, 4(sp)
	sw t4, 0(sp)
	jal Mult
	lw t4, 0(sp)
	addi sp, sp, 4

	lw ra,8(sp)
	addi sp,sp,16
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