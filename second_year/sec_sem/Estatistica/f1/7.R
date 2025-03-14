x <- 40
n <- 1000
prop_esp <- 0.02
z <- (x/n - prop_esp) / sqrt(prop_esp * (1 - prop_esp) / n)
p_valor <- 2 * (1 - pnorm(abs(z)))
p_valor

# Intervalo de confiança
se <- sqrt((x/n) * (1 - x/n) / n)
IC <- c((x/n) - qnorm(0.995) * se, (x/n) + qnorm(0.995) * se)
IC

