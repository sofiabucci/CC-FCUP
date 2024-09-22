data Arv a = Vazia | No a (Arv a) (Arv a)

construir :: [a] -> Arv a
construir [] = Vazia
construir xs = No x (construir xss) (construir xsss)
        where n = div (length xs) 2 
              xss = take n xs 
              x:xsss = drop n xs


construirL :: Ord a => [a] -> Arv a
construirL [] = Vazia
construirL (x:xs) = inserir x (construir xs)

inserir :: Ord a => a -> Arv a -> Arv a
inserir x Vazia = No x Vazia Vazia
inserir x (No y esq dir)
        | x==y = No y esq dir 
        | x<y = No y (inserir x esq) dir 
        | x>y = No y esq (inserir x dir)  