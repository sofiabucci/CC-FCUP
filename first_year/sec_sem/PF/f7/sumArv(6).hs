import Prelude
data Arv a = Vazia | No a (Arv a) (Arv a)

listar :: Arv a -> [a]
listar Vazia = []
listar (No x esq dir) = listar esq ++ [x] ++ listar dir

sumArv :: Num a => Arv a ->a
sumArv arv = sum(listar arv)