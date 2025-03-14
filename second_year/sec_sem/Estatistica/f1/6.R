dados <- c(5, 150, 0.05)
z <- (dados[1]/dados[2] - dados[3]) / sqrt(dados[3]*(1 - dados[3]) / dados[2])
p_valor <- 2 * (1 - pnorm(abs(z)))
p_valor
