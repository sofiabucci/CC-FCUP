1.
def centenas(x):
    if x<100:
        return "não há dígitos nas centenas"
    else:
        return (x//100)%10
    
2.
def invertstr(s):
    str=""
    ls=s.split(" ")
    for i in ls:
        str+=i[::-1]
        str+=" "
    return str
    
3.
import random
def sortlist():
    list=[]
    for i in range(10):
        list.append(random.randint(0,50))
    number={}
    number[max(list)]=list.index(max(list))
    number[min(list)]=list.index(min(list))
    return number

4.
def palíndromo(s):
    ls=s.split(" ")
    if ls == ls.reverse():
        return "palíndromo"
    else:
        return "não palíndromo"
    
5.
def list2tuple(list):
    dict={}
    t=tuple(list)
    for i in t:
        dict[i]=t.count(i)
    return dict

6.
class Library:
    def __init__(self,nome,autor,quant):
        self.nome=nome
        self.autor=autor
        self.stock=int(quant)
        
    def __str__(self):
        return f'{self.nome}, {self.autor}'
    
    def __add__(self,livros):
        for key,value in livros.items():
            if self.nome==key[0] and self.autor==key[1]:
                value[0]+=self.stock
                return livros
        else:
            livros[self.nome,self.autor]=[self.stock]
            return livros
    
    def __sub__(self,livros):
        for key,value in livros.items():
            if self.nome==key[0] and self.autor==key[1]:
                if value[0]>=self.stock:
                    value[0]-=self.stock
                    return livros
                else:
                    return 0
        else:
            return 1
    
def livroadd():
    nome,autor,quant=input("insira o nome, autor, e quantidade de livros que deseja adicionar.\n").split()
    return Library(nome,autor,quant)
def livrosub():
    nome,autor,quant=input("insira o nome, autor, e quantidade de livros que deseja retirar.\n").split()
    return Library(nome,autor,quant)


menu=["1 - adicionar livro","2 - retirar livro","3 - consultar estoque","4 - sair"]
livros={}
while True:
    for i in menu:
        print(i)
    option=int(input())
    if option-1==0:
        n=int(input("deseja adicionar quantos livros diferentes?\n"))
        for i in range(n):
            l=livroadd()
            l.__add__(livros)
            print(l.__str__(),"adicionado")
            
    elif option-1==1:
        n=int(input("deseja retirar quantos livros diferentes?\n"))
        for i in range(n):
            l=livrosub()
            s=l.__sub__(livros)
            if s==0:
                print("Livro indisponível (estoque insuficiente, consulte estoque)")
            elif s==1:
                print("Livro indisponível (estoque inexistente)")
            else:
                print(l.__str__(),"retirado")
            
    elif option-1==2:
        if sum(livros.values())!=0:
            print("Livros - Autor - Estoque")
            for key,value in livros:
                if value[0]>0:
                    print(key[0],key[1],value[0])
        else:
            print("Estoque vazio")
                
    elif option-1==3:
        exit
        
    else:
        print("opção inválida")
        