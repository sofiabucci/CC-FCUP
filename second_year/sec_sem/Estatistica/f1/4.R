dados <- c(63, 68, 79, 65, 64, 63, 65, 44, 76, 74, 66, 46, 67, 73, 69, 76, 75, 78, 88, 42, 64, 41, 65, 65)
n <- length(dados)
mu0 <- 70
t <- (mean(dados) - mu0) / (sd(dados) / sqrt(n))
p_valor <- pt(t, df=n-1)
p_valor

