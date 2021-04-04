.data
li a0,11	#valor de x
li a1,0		#valor de y
li a2,10
li a3,1


.text
blt  a2,a0,xif
addi a0,a0,10
li   x17,10
ecall

xif:
blt a1,a3,yif
li  x17,10
ecall

yif:
addi a0,a0,-10
li   x17,10
ecall
