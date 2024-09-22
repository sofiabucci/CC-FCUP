
def anoAluno(codigo):
    ano=''
    for i in range(4):
        ano+=codigo[i]
    return ano
        
def cursoAluno(codigo):
    curso=''
    for i in range(4,7):
        curso+=codigo[i]
    return curso
        
        
    
c=list(str(input()))
print(anoAluno(c))
print(cursoAluno(c))

