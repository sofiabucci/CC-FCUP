total=minimo=maximo=0
sonsdois=["piupiu","cocorocoo","cacaraca","quaqua"]
sonsquatro=["miao","auau","muuu","meemee"]

reg=list(input().split())
while int(reg[0])!=0:
    total+=1
    if int(reg[0])==2:
        maximo+=1
        if (reg[1] in sonsquatro) or (len(reg[1])>9) or ("jaco" in reg[1]):
            minimo+=1
    reg=list(input().split())

            
print(total, minimo, maximo)


