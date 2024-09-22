#a
nota= int(input("diga a nota: \n"))

if nota >= 18:
    print("excelente")
elif nota >= 16:
    print("muito bom")
elif nota >= 14:
    print("bom")
elif nota >= 10:
    print("suficiente")
else:
    print("insuficiente")

#b
nota= int(input("diga a nota: \n"))
aprov= 0
total= 0

while nota != -1 :
    total += 1
    if nota >= 10:
        aprov += 1
    nota= int(input("diga a nota: \n"))

print(str(aprov) + "/" + str(total))

print("%d/%d" % (aprov,total))


#c
nota= int(input("diga a nota: \n"))
aprov= 0
total= 0

while nota != -1:
    
    if nota >= 10:
        total += 1
        aprov += nota
        
    nota= int(input("diga a nota: \n"))

if aprov == 0:
    print(0)
else:
    print(aprov/total)   