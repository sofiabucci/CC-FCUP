import Prelude

primo :: Integer -> Bool 

primo p = length([x | x <- [1..p], mod p x == 0 ]) == 2
