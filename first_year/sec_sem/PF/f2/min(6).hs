mini :: Ord a => a -> a -> a -> a

mini x y z | x<y && x<z = x
           | y<x && y<z = y
           | z<x && z<y = z