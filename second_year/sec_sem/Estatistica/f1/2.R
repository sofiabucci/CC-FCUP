n <- 3918
media <- 0.9
desvio <- 0.96
mu0 <- 1.0
alpha <- 0.05
z <- (media - mu0) / (desvio / sqrt(n))
p_valor <- 2 * pnorm(z)
p_valor

