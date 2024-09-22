import Prelude

fromBits :: [Int] -> Int
fromBits bit = foldl (\n b -> n * 2 + b) 0 bit