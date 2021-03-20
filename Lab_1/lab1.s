V.1

.data
u1: .word 1	  #primeiro numero da sucessão
u2: .word 1	  #segundo numero da sucessão

.text
li x14,2		 #offset da contagem (pois ja temos os 2 primeiros membros)
li x15,10	 #numero de membros que se deseja da sucessão
la a0,u1         #Load da adress do primeiro membro da sucessão (x10=a0 vai ter o valor do endereço de u1)

while:
lw x11,0(a0)       #Load dos valores da memoria
lw x12,4(a0)
add x13,x12,a1	  #soma dos membros
sw x13,8(a0)       #guarda o valor da soma de un=u(n-2)+u(n-1)
addi x14,x14,1	  #contagem do numero de ciclos
addi x10,x10,4	  #salta para a posição de memoria seguinte
blt x14,x15,while   #repete o ciclo até atingir o numero definido na linha 7

li x17,10         #termina o programa
ecall



V.2

.data
u1: .word 1	  #primeiro numero da sucessão
u2: .word 1	  #segundo numero da sucessão

.text
li x14,2		 #offset da contagem (pois ja temos os 2 primeiros membros)
li x15,10	 #numero de membros que se deseja da sucessão
la a0,u1         #Load da adress do primeiro membro da sucessão (x10=a0 vai ter o valor do endereço de u1)

for:
bge x14,x15,end  #repete o ciclo até atingir o numero definido na linha 7
lw x11,0(a0)       #Load dos valores da memoria
lw x12,4(a0)
add x13,x12,a1	  #soma dos membros
sw x13,8(a0)       #guarda o valor da soma de un=u(n-2)+u(n-1)
addi x14,x14,1	  #contagem do numero de ciclos
addi x10,x10,4	  #salta para a posição de memoria seguinte
j for

end:
li x17,10         #termina o programa
ecall
