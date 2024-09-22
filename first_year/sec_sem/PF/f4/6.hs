import Prelude

iminimum :: Ord a => [a] -> a
iminimum [x] = x
iminimum (x:xs) = min x (iminimum xs)

idelete :: Eq a => a -> [a] -> [a]
idelete _ [] = []
idelete c (x:xs) | c == x = xs
                 | otherwise = x : idelete c xs

issort :: Ord a => [a] -> [a]
issort [] = []
issort [x] = [x]
issort list =  iminimum list : issort (idelete (iminimum list) (list))