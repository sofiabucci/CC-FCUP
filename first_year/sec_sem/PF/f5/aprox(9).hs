import Prelude 

aproxPi1, aproxPi2 :: Int -> Double

aproxPi1 parcela = 
    let a = take parcela (iterate (2+) 1)
        b = take parcela (cycle [1,-1])
        c = zipWith (*) a b
        d = map (4/) c
    in sum d

aproxPi2 parcela = 
    let a = take (parcela-1) (map (\x -> x*(x+1)*(x+2)) [2,4..])
        b = take parcela (cycle [1,-1])
        c = zipWith (*) a b
        d = map (4/) c
    in if parcela == 1 then 3
       else 3 + sum d
        
