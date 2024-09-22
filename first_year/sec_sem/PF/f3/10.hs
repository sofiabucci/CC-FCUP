import Prelude

nub :: Eq a => [a] -> [a] 
nub (x:xs) | elem x xs = nub xs
           |  otherwise = x : nub xs
nub [] = []