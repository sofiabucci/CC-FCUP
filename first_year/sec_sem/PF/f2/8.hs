import Prelude

safetail :: [a] -> [a]

safetail exp | length(exp) /= 0 = tail exp
             | otherwise = []

safetail exp = if length(exp) == 0 then [] else tail exp

safetail exp = if length(exp) /= 0 then tail exp else []