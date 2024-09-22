adn=[]
adnm=[]
c=str(input())

while c!="#":
    adn.append(c)
    c=str(input())

for i,x in enumerate(adn):
    if i==0:
        adnm.append(x)
    elif i>=1:
        y=adn[i-1]
        if x!=y:
            if x=="a":
                if y=="t":
                    adnm.append("c")
                elif y=="c":
                    adnm.append("t")
            if x=="c":
                if y=="t":
                    adnm.append("a")
                elif y=="a":
                    adnm.append("t")
            if x=="t":
                if y=="a":
                    adnm.append("c")
                elif y=="c":
                    adnm.append("a")     
        else:
            adnm.append(x)    

for _ in range(len(adnm)):      
    print(adnm[_])