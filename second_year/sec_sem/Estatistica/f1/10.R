ausencia <- c(0.550, 0.177, 0.564, 0.140, 0.127, 0.136, 0.152, 0.162, 0.220, 0.128, 0.759, 0.332, 0.136, 0.226, 0.475, 0.388)
presenca <- c(0.000, 0.000, 0.000, 0.050, 0.125, 0.105, 0.000, 0.050, 0.000, 0.000, 0.000, 0.126, 0.020, 0.000, 0.010, 0.100)
teste <- t.test(ausencia, presenca, alternative="greater")
teste$p.value

