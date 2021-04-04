.data
auipc a0 0x10000
li    a1,0xfffeff #valor que vai ser guardado em memoria
addi  a7,zero,32
addi  a6,zero,32 #vai guardar o nmr de bits



.text
sw a1,0(a0)
lw a2,0(a0)
lw a3,0(a0)

function:
srli a3,a3,1
slli a3,a3,1
xor  a4,a2,a3

bne  a4,x0,um
addi a5,a5,1
srli a3,a3,1
srli a2,a2,1
beq  a2,zero,end
jal  function

um:
addi a7,a7,-1
sub  a7,a7,a5
addi a5,zero,0
srli a3,a3,1
srli a2,a2,1
jal function


end:
sub a6,a6,a7
li  x17,10
ecall
