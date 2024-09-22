import Prelude 

mediana :: Int -> Int  -> Int -> Int

mediana x y z | (x>=y && y>=z ) || (x<=y && y<=z ) = y
              | (y>=x && x>=z ) || (y<=x && x<=z ) = x
              | otherwise = z
              

mediana :: Int -> Int -> Int -> Int 

mediana x y z = soma-(maior+menor)
    where soma = x+y+z
          menor = if x>=y then (if y>=z then z else y) else (if x>=z then z else x)
          maior = if x>=y then (if x>=z then x else z) else (if y>=z then y else z)