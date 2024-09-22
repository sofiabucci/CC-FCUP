import Prelude
import Data.List

intersperse :: a -> [a] -> [a]
intersperse e exp | length exp == 0 = []
                  | length exp == 1 = exp
                  | otherwise = x : e : intersperse e xs 
                    where x=head(exp)
                          xs=tail(exp)