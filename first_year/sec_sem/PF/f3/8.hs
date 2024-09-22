import Prelude

myconcat :: [[a]] -> [a]
mycontat ls = [e | l <- ls, e <- l]

myreplicate :: Int -> a -> [a]
myreplicate n e = [e | _ <- [1..n]]

my(!!) ::  [a] -> Int -> a
my(!!) ls n = [ls | n <- n]