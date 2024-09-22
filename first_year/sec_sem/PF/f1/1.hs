incr :: Int -> Int
incr x = x+1

triple :: Int -> Int
triple x = 3*x

welcome :: String -> String
welcome name = "Hello, " ++ name ++ "!"

count :: String -> String
count str = show (length str) ++ " characters."

incr (triple 3)
triple (incr (3+1))
triple (incr 3 + 1)
triple (incr 3) + 1
welcome "Harry" ++ welcome "Potter"
welcome ("Harry" ++ " Potter")
welcome (welcome "Potter")
count "Expelliarmus!"
count (count "Expelliarmus!")