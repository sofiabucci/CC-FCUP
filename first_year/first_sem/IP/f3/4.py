n = int(input("diga um inteiro para a sequência: \n"))
k = maior = int(input("diga um inteiro:\n"))
menor = 0 

if n >= 1 : 
    i = 0
    for i in range (n-1):
        k =  int(input("diga um inteiro:\n"))
        if k > menor:
            if k > maior:
                menor = maior
                maior = k
            else :
                menor = k
        
    if k < 0:
        print("não existem inteiros positivos")
    elif maior == menor:
        print("todos iguais a", k)
    else:
        print(maior, menor)
           
else:
    print("insira um valor válido")
    
