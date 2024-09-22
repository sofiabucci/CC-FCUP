import Prelude

insert :: Ord a => a -> [a] -> [a]
insert e [] = [e]
insert e (x:xs) | e < x = e:(x:xs)
                | otherwise = x:(insert e xs)

sort :: Ord a => [a] -> [a]
sort [] = []
sort (x:xs) = insert x (sort xs)
             