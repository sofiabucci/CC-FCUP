import Prelude

divisores :: Int -> [Int]
divisores n = filter (\x -> mod n x == 0) [1..]