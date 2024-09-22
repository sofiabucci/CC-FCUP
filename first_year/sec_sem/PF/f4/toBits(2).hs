import Prelude

toBitsRev :: Int -> [Int]
toBitsRev bits | bits == 0 = []
               | otherwise = (mod bits 2) : toBitsRev (div bits 2)

toBits :: Int -> [Int]
toBits bits = reverse(toBitsRev bits)

