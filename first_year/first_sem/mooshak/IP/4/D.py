dados={}
n,r=map(int,input().split())
for i in range(r):
    rede=list(map(int,input().split()))
    dados[(rede[0],rede[1])]=[rede[2],rede[3]]
    
t=int(input())
for i in range(t):
    reserva=list(map(int,input().split()))
    valor=0
    lugar=[]
    lugares=reserva[0]
    for j in range(2,len(reserva)-1):
        if (reserva[j],reserva[1+j]) in dados:
            if lugares>dados[(reserva[j],reserva[1+j])][0]:
                print("Sem lugares suficientes em (%d,%d)" %(reserva[j],reserva[1+j]))
                valor=0
                break
            else:
                valor+=(dados[(reserva[j],reserva[1+j])][1])*(lugares)
                lugar.append((reserva[j],reserva[1+j]))
        else:
            print("(%d,%d) inexistente" %(reserva[j],reserva[1+j]))
            valor=0
            break
    if valor!=0:
        for j in range(len(lugar)):
            dados[lugar[j]][0]-=lugares
        print("Total a pagar: %d" % valor)