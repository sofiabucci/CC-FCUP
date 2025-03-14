prop_obs <- 0.15
prop_esp <- 0.05
n <- 120
z <- (prop_obs - prop_esp) / sqrt((prop_esp * (1 - prop_esp)) / n)
p_valor <- 2 * (1 - pnorm(abs(z)))
p_valor
