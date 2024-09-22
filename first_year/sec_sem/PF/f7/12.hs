data Arv a = Vazia | No a (Arv a) (Arv a)

removerAVL :: Ord a => a -> Arv a -> Arv a
removerAVL x Vazia = Vazia
removerAVL x (No y esq dir h)
    | x < y = balancear (No y (removerAVL x esq) dir h)
    | x > y = balancear (No y esq (removerAVL x dir) h)
    | otherwise = combinar esq dir
    where
        combinar Vazia dir = dir
        combinar esq Vazia = esq
        combinar esq dir = No menor esq (removerAVL menor esq) dir (1 + max (altura esq) (altura dir))
            where menor = mais_a_esquerda dir

        mais_a_esquerda (No x Vazia _ _) = x
        mais_a_esquerda (No _ esq _ _) = mais_a_esquerda esq

        balancear arvore
            | fatorBalanceamento arvore > 1 = rotacaoEsquerda arvore
            | fatorBalanceamento arvore < -1 = rotacaoDireita arvore
            | otherwise = arvore
