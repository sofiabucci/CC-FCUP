import Prelude

pitagorico :: Int -> [(Int, Int, Int)]

pitagoricos lim = [(x,y,z)| x <- [1..lim], y <- [1..lim], z <- [1..lim], (x*x)+(y*y)==(z*z)]

