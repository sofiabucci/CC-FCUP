import Prelude

algarismosRev :: Int -> [Int]
algarismosRev alg | alg < 10 = [alg]
                  |otherwise = (mod alg 10) : algarismosRev (div alg 10)
                  


algarismos :: Int -> [Int]
algarismos alg | alg < 10 = [alg]
               | otherwise = reverse(algarismosRev(alg))
