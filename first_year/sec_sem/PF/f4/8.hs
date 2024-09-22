import Prelude

moedas = [200,100,50,20,10,5,2]

trocos :: Int -> [Int]
trocos 0 = []
trocos valor = x:trocos (valor- x)
               where x = head[moeda | moeda <- moedas , moeda <= valor]