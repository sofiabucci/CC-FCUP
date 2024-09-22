import Prelude

wc :: IO()
wc = do
    arc <- getContents
    let (l, p, c) = ler arc
    print l
    print p
    print c


ler :: String -> (Int, Int ,Int)
ler arc = let l = length $ lines arc
              p = length $ words arc
              c = length arc
          in (l, p, c)