import Prelude

binom :: Integer -> Integer -> Integer 
pascal :: Integer -> [[Integer]]

binom n k = (product [1..n]) `div` ((product [1..k]) * (product [1..(n - k)]))

pascal p = [[binom l b| b <- [0..l]] | l <- [0..p]] 