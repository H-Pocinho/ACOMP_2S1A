#a

.text
la x10,INT
csrrw x0,stvec,x10
li x10,0b0010000
csrrw x0,sie,x10
csrrsi x0,sstatus,0b10

INT:
csrrw x10,scause,x0 
addi x11,x10,-5
bne x11,x0,checkTemp


#b

checkTemp:
.text
li a0,0xFFFF000C
lw a1,-2(a0)
lw a2,0(a0)
li a3,50
li a4,40
li a5,1

bgt a2,a3,maior
blt a2,a4,menor
j end


menor:
bne a1,x0,end
lw a5,-2(a0)
j end

maior:
beq a1,x0,end
lw a5,-2(a0)

end:
ret

#c
#Guarda o valor de GIE em SPIE
#Mete GIE a 0
#o valor de STVEC  passa para PC
#o valor de PC+4 passa para SEPC
#scause muda para o valor numerico da interrupção neste caso 5 