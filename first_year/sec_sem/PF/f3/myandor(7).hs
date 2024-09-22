import Prelude

myand :: [Bool] -> Bool
myand [] = True
myand  (x:list) = x && myand list

myor :: [Bool] -> Bool
myor [] = False
myor (x:list) = x || myor list


myconcat :: [[a]] → [a] 
myconcat (x:ls) = x ++ myconcat ls

myreplicate :: Int → a → [a] 
myreplicate n e | n == 0 = []
                | otherwise = e : myreplicate (n-1) e

my(!!) :: [a] → Int → a 
my(!!) (x:ls) n | n==0 = x
                | otherwise = my(!!) (ls) (n-1)

myelem :: Eq a ⇒ a → [a] → Bool — testar se um valor ocorre numa lista.
myelem (x:ls) v | x == v = True
                | otherwise = myelem ls v 