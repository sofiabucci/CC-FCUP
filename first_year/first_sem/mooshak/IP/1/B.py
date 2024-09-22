a,b,c,d= map(int,input().split())

if c>= 37:
    if c>a:
        print("FEBRE SUBIU")        
    elif c<a:
        print("FEBRE BAIXOU")
    elif c==a:
        if d==b:
            print("FEBRE MANTEVE")
        elif d>b:
            print("FEBRE SUBIU")
        else:
            print("FEBRE BAIXOU")
else:
    print("NORMAL")
    