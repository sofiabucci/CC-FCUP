import Prelude

second ::  [a] -> a
second exp = drop 1 (take 2 exp)

last :: [a] -> a
last exp = head (reverse exp)
last exp = drop (length exp -1) exp

init :: [a] -> a
init exp = reverse (tail (reverse exp))
init exp = take (length exp -1) exp

middle :: [a] -> Int -> a
middle exp = exp !! (div (length exp) 2)

checkPalindrome :: String -> Bool
checkPalindrome exp = if exp==reverse exp then True else False

