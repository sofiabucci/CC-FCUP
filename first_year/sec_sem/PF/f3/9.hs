import Prelude

mindiv :: Int -> Int
mindiv n = head[x | x <- [2..floor(sqrt(fromIntegral n))], mod n x == 0 ]

sprimo :: Integer -> Bool 
sprimo p | head[x | x <- [2..floor(sqrt(fromIntegral p))], mod p x == 0 ] == p = True
         | otherwise = False