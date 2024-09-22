import Prelude

goldbach :: Integer -> (Integer, Integer)            
goldbach n = head [(p, n - p) | p <- [2..n], isPrime p, isPrime (n - p)]
             where isPrime m = m>1 && all (\x -> mod m x /= 0) [2..isqrt m]
                   isqrt = floor . sqrt . fromIntegral
                   