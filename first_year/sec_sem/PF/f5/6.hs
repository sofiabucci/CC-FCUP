import Prelude

isort :: Ord a => [a] -> [a]
isort [] = []
isort list = foldr (insert) [] list


insert :: Ord a => a -> [a] -> [a]
insert e [] = [e]
insert e (x:xs) | e < x = e:(x:xs)
                | otherwise = x:(insert e xs)


