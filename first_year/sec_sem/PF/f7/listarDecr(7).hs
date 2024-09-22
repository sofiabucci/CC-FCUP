import Prelude
import Data.List

data Arv a = Vazia | No a (Arv a) (Arv a)

listar ::  Arv a -> [a]
listar Vazia = []
listar (No x esq dir) = listar esq ++ [x] ++ listar dir

listarDecr :: Ord a => Arv a -> [a]
listarDecr arv = reverse(sort (listar arv))