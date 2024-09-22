import Prelude

euclides :: Integer -> Integer -> Integer
euclides a b | b == 0 = a
             | otherwise = euclides b (mod a b)