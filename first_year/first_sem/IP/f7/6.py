def discAluno(codigo,alunos,disciplinas) :
    for key,value in alunos.items():
        if key==codigo:
            print("Disciplinas de %s (%s)\n" %(codigo, alunos[codigo][0]))
            for i,x in enumerate(alunos[codigo][2]):
                print(disciplinas[x][0]+"\n")
        
codigo=str(2002019043)
discAluno(codigo,alunos,disciplinas)


def discAluno(codigo,alunos,disciplinas,nomefich) :
    for key,value in alunos.items():
        if key==codigo:
            nomefich.write("Disciplinas de %s (%s)\n" %(codigo, alunos[codigo][0]))
            for i,x in enumerate(alunos[codigo][2]):
                nomefich.write(disciplinas[x][0]+"\n")
        
codigo=str(2002019043)
nomefich=open("soso.txt","+w")
discAluno(codigo,alunos,disciplinas,nomefich)
nomefich.close()
