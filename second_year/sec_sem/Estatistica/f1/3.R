
dados <- c(21, 11)
n <- 49
mu0 <- 30
t <- (dados[1] - mu0) / (dados[2] / sqrt(n))
p_valor <- pt(t, df=n-1)
p_valor
