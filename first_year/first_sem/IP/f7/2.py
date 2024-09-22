def ler_disciplinas(file):
    n=int(file[0])
    disciplinas=[(None,0)] 
    for _ in range(1,n*2,2):   
        nome=file[_].replace("\n","")
        ano=int(file[_+1])
        disciplinas.append((nome,ano))   
    return disciplinas

def ler_dados_alunos(file): 
    n=int(file[0])
    alunos={}
    for _ in range((n+1)*2,len(file),2):   
        nome=file[_].replace("\n","")
        linha=list(map(int,file[_+1].split()))
        alunos[str(linha[0])]=(nome,linha[1],linha[2:])
    return alunos

def ler_dados(fich):
    file=fich.readlines()
    disc=ler_disciplinas(file)
    alunos=ler_dados_alunos(file)
    return (disc,alunos)    

fich=open("bdAlunos_fp7.txt","r")
disciplinas,alunos=ler_dados(fich)
fich.close()

