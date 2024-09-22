#a (aparecem todos múltiplos sem somar)
k = 4
s = 0
 
while k != 1004:
    s += k
    k +=4
   
print("soma = " + str(s))

    
#b (soma não definida)
soma = 0

for valor in range (0, 1004, 4):
    soma += valor
    
print("soma = %d" %(soma))