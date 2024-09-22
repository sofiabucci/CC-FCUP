import Prelude

perfeitos :: Integer -> [Integer]

perfeitos a = [x | x <- [1..a], sum([y | y <- [1..div x 2], mod x y == 0 ])==x ]

