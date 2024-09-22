data Arv a = Vazia | No a (Arv a) (Arv a)

mapArv :: (a->b) -> Arv a -> Arv b
mapArv _ Vazia = Vazia
mapArv f (No valor esq dir) = No (f valor) (mapArv f esq) (mapArv f dir)
 