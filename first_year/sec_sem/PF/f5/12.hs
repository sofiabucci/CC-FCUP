import Prelude

hammingAux :: Integer -> [Integer]
hammingAux n = [2^i*3^j*5^k | i<-[0..], j<-[0..], k<-[0..], i+j+k==n]

hamming :: [Integer]
hamming = concatMap hammingAux [0..]
