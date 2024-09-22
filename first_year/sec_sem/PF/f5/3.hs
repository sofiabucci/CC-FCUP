import Prelude

(++) :: [a] → [a] → [a]
(++) x y = foldr (:) y x

concat :: [[a]] → [a]
concat xs = foldl (++) [] xs

reverse :: [a] → [a]
reverse l = foldr (\x  r -> r ++ [x]) [] l

reverse :: [a] → [a]
reverse l = foldl (flip(:)) [] l

elem :: Eq a ⇒ a → [a] → Bool 
elem x xs = any (==x) xs