a,b=map(int,input().split())
c,d=map(int,input().split())
M=(c-a)*60+d-b
H=M//60
min=M%60
res="Queres dizer, "

if M==1:
    print("Passou apenas 1 minuto!")
else:
    print("Passaram apenas %d minutos!" % M)    
if M<60:
    print("De facto!") 
else: 
    if H==1:
        res+="1 hora"
    else:
        res+="%d horas" % H   
    if min==1:
        res+=" e 1 minuto"
    elif min>1:
        res += " e %d minutos" % min

    res+="?!"
    print(res)
        
