def pontos(jogo,o,x):
    s=0
    for i in range(6):
        if jogo[i].count("O")>=4:      
            for j in range(7):    
                if jogo[i][j]=="O":
                    while j+s<7 and jogo[i][j+s]=="O":
                        o+=1
                        s+=1
                    if o>=4:
                        return "O"
                    s=o=0
        if jogo[i].count("X")>=4:
            for j in range(7):                     
                if jogo[i][j]=="X":
                    while j+s<7 and jogo[i][j+s]=="X":
                        x+=1
                        s+=1
                    if x>=4:
                        return "X"
                    s=x=0
    s=0
    for j in range (7):
        for i in range(6):
            if jogo[i][j]=="O":
                while i+s<6 and jogo[i+s][j]=="O":
                    o+=1
                    s+=1
                if o>=4:
                    return "O"    
                s=o=0
            if jogo[i][j]=="X":
                while i+s<6 and jogo[i+s][j]=="X":
                    x+=1
                    s+=1
                if x>=4:
                    return "X"
                s=x=0
    s=0    
    for i in range(6):
        for j in range(7):
            if jogo[i][j]=="O":  
                while i+s<6 and j+s<7 and jogo[i+s][j+s]=="O":
                    o+=1
                    s+=1
                if o>=4:
                    return "O"   
                s=o=0  
            if jogo[i][j]=="X":
                while i+s <6 and j+s<7 and jogo[i+s][j+s]=="X":
                    x+=1
                    s+=1
                if x>=4:
                    return "X"
                s=x=0 
              
    for i in range(6):
        for j in range(7):
            if jogo[i][j]=="O":  
                while i+s<6 and j-s>=0 and jogo[i+s][j-s]=="O":
                    o+=1
                    s+=1
                if o>=4:
                    return "O"   
                s=o=0  
            if jogo[i][j]=="X":
                while i+s <6 and j-s>=0 and jogo[i+s][j-s]=="X":
                    x+=1
                    s+=1
                if x>=4:
                    return "X"
                s=x=0 
        
    
    if "." in jogo[0]:
        return "on"
    else:
        return "off"
                
jogo=[]
o=x=0    
    
for _ in range(6):
        jogo.append(list(str(input())))
        
m=pontos(jogo,o,x)

if m=="O":
    print("GANHOU O")        
elif m=="X":
    print("GANHOU X")      
elif m=="on":
    print("JOGANDO")       
elif m=="off" :
    print("EMPATE")
        