x <- 238
n <- 250
prop_esp <- 0.9
z <- (x/n - prop_esp) / sqrt(prop_esp * (1 - prop_esp) / n)
p_valor <- 2 * (1 - pnorm(abs(z)))
p_valor

