def media_ndisc(curso,alunos):
    a=0
    c=0
    for key,values in alunos.items():
        if curso in key:
            c+=values[1]
            a+=1
        
    media=c/a
    return media
curso=""
print(media_ndisc(curso,alunos))
    