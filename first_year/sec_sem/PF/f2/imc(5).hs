imcclass :: Float -> Float -> String

imcclass peso, altura = | imc>=30 = "obesidade"
                        | imc>=25 = "excesso de peso"
                        | imc>=18.5 = "peso normal"
                        | otherwise = "baixo peso"
                        where imc = (peso / (altura ** 2))

                        