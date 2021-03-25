.text
auipc x10 0x10000		#carrega o endereço inicial da memoria
li x12,1 				#registo que contem os factoriais
li x13,1				#registo que contem o 3^i
li x14,10				#registo que contem o numero de repetições
li x15,2				#registo com os valores da sucessão para i=0				
sw x15,0(x10)			#guarda na memoria o valor para i=0
			

while:
li x16,3				#serve para dar 'reset' ao registo x16
addi x11,x11,1			#incremento de 1 no i (x11 contem i)
mul x12,x12,x11			#calculo do factorial
mul x13,x13,x16			#calculo de 3^i		
add x16,x12,x13			#soma do expoente e do fatorial e colocado em x16
sw x16,4(x10)			#Guarda na memoria
addi x10,x10,4			#incrementa o apontador do endereço
bgt x14,x11,while 		#condição do loop

li x17,10
ecall