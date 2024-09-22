maxi :: Ord a => a -> a -> a -> a

maxi x y z | x>=y && x>=z = x
           | y>=x && y>=z = y
           | z>=x && z>=y = z

maxi x y z | x>=y  = maxi x z
           | otherwise = maxi y z