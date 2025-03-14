fase_inicial <- c(70, 87, 72, 70, 71, 68, 73, 66, 63, 57, 65, 68)
fase_final <- c(79, 87, 73, 77, 75, 73, 80, 64, 64, 60, 62, 70)
teste <- t.test(fase_inicial, fase_final, paired=TRUE)
teste$p.value

