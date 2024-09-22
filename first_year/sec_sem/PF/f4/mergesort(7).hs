import Prelude

imerges :: Ord a => [a] -> [a] -> [a]
imerges x [] = x
imerges [] y = y
imerges (x:xs) (y:ys) | x < y = x:imerges xs (y:ys)
                      | otherwise = y:imerges (x:xs) ys

leftHalf ::  [a] -> [a]
leftHalf exp = take (div (length exp) 2) exp

rightHalf ::  [a] -> [a]
rightHalf exp = drop (div (length exp) 2) exp

metades :: [a] -> ([a], [a])
metades exp = (leftHalf(exp),rightHalf(exp))

imsort :: Ord a => [a] -> [a]
imsort [] = []
imsort [x] = [x]
imsort exp = imerges (imsort x) (imsort y)
             where x = fst(metades(exp))
                   y = snd(metades(exp))
