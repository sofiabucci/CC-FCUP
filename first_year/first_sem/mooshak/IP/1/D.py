
a,b,c=map(int,input().split())

if b!=c:
        if (abs(a-b)==abs(a-c)):
            if b>c:
                print(1)
            else:
                print(2)
        elif (abs(a-b)>abs(a-c)):
            print(2)
        else:
            print(1)
                 
else:
    if b==c==999:
        print(0)        
    else:
        print(1)
        