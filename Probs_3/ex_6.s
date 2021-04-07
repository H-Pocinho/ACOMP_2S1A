#Criado por Henrique Alves Pocinho IST199952

.data
escolhe: .word 1 #permite escolher que função executar (0 ler 1 guardar)
endereco: .word 0x10000040 
i: .word 3
j: .word 4
ncolunas: .word 10
valor: .word 10

.text
lw x10 escolhe
lw x11 endereco
lw x12 i
lw x13 j
lw x14 ncolunas
lw x16 valor

beq x10,x0,ler
j guardar


ler:
mul x15,x12,x14
slli x15,x15,2
add x11,x15,x11
sw x16,0(x11)

li   x17,10
ecall

guardar:
mul x15,x12,x14
slli x15,x15,2
add x11,x15,x11
sw x16,0(x11)

li   x17,10
ecall