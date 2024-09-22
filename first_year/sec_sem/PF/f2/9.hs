import Prelude

curta :: [a] -> Bool

curta exp | length(exp) > 2 = False
          | otherwise = True  

curta exp = if length(exp) > 2 then False else True

curta exp = if length(exp) <= 2 then True else False

