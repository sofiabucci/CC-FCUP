import Prelude

divprop :: Int -> [Int]

divprop a = [x | x <- [1..(div a 2)], mod a x == 0 ]