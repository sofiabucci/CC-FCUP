# Dados da pressão arterial sistólica
dados <- c(162, 177, 151, 167, 141, 153, 143, 157, 123,
           161, 147, 157, 141, 157, 151, 134, 134, 128,
           151, 112, 142, 121, 130, 134, 120)

# (a) Análise gráfica para verificar a simetria da distribuição
par(mfrow=c(1,2))  # Criar múltiplos gráficos na mesma janela
hist(dados)
boxplot(dados)


# (b) Media > 140
media<-mean(dados)
media
dp<-sd(dados)
dp


# (c) Teste de Hipótese, Media amostral > 140
# t = (mean(dados) - mu0) / (sd(dados) / sqrt(n))
t1<-(mean(dados)-140)/sd(dados)*sqrt(25)
t2<-(mean(dados)-140)/(sd(dados)/sqrt(25))
qu<-qt(.99,24)
pval<-1-pt(t1,24)
c(t1,t2,qu,pval)
#alternativa
t.test(x,alternative = "greater", mu=140, conf.level = 0.99)
#os dados amostrais não nos dão evidências para concluir


# (d) 
