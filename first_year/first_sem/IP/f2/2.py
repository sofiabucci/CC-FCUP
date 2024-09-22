v= int(input("indique um inteiro positivo: \n"))
t= 1

while v <= 0 and t <= 2:
    v= int(input())
    t= t+1

if v > 0:
    print("%d // %d = %d" %(v,t,v//t))

else:
    print("errou", t ,"vezes")
