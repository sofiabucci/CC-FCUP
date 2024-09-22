import Prelude

maxIndex :: Ord a => [a] -> (a, Int)
maxIndex a = maximum (zip a [0..])

hondtAux :: Int -> [Int] -> [Int] -> [Int]
hondtAux dep vt lf | dep == 0 = lf
                   | otherwise = let lc = map (\(v,d) -> div v (1+d)) (zip vt lf) 
                                     inddep = snd(maxIndex lc)
                                     newlf = map (\(n, m) -> if n == inddep then m + 1 else m) (zip [0..] lf)
                                 in hondtAux (dep-1) vt newlf
             
hondt :: Int -> [Int] -> [Int]
hondt dep vt = hondtAux dep vt (take (length vt) (repeat 0))
                         

                             