.data
u1: .word 1	    #primeiro numero da sucessão
u2: .word 1	    #segundo numero da sucessão

.text
li a4,2			#offset da contagem (pois ja temos os 2 primeiros membros)
li a5,10		#numero de membros que se deseja da sucessão
la a0,u1    #Load da adress do primeiro membro da sucessão (x10=a0 vai ter o valor do endereço de u1)

while:
lw a1,0(a0)		  #Load dos valores da memoria
lw a2,4(a0)
add a3,a2,a1	  #soma dos membros
sw a3,8(a0)    #guarda o valor da soma de un=u(n-2)+u(n-1)
addi a4,a4,1	  #contagem do numero de ciclos
addi a0,a0,4	  #salta para a posição de memoria seguinte
blt a4,a5,while   #repete o ciclo até atingir o numero definido na linha 7
