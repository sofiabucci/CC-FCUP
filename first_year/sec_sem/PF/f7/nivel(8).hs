import Prelude
data Arv a = Vazia | No a (Arv a) (Arv a)

nivel :: Int -> Arv a -> [a]
nivel n Vazia = []
nivel 0 (No valor _ _) = [valor]
nivel n (No _ esq dir) = nivel (n-1) esq ++ nivel (n-1) dir

