 import Prelude
import Data.Char
import Data.List

data Prop = Const Bool -- constante
            | Var Char -- variável
            | Neg Prop -- negação
            | Conj Prop Prop -- conjunção
            | Disj Prop Prop -- disjunção
            | Impl Prop Prop -- implicação
            deriving (Eq,Show)

type Assoc k v = [(k,v)]   

type Atrib = Assoc Char Bool

finds :: Eq k => k -> Assoc k v -> v
finds k assocs = head [v | (s,v)<-assocs, k==s]

valor :: Atrib -> Prop -> Bool
valor s (Const b) = b
valor s (Var x) = finds x s
valor s (Neg p) = not (valor s p)
valor s (Conj p q) = valor s p && valor s q
valor s (Disj p q) = valor s p || valor s q
valor s (Impl p q) = not (valor s p) || valor s q

vars :: Prop -> [Char]
vars (Const _) = []
vars (Var x) = [x]
vars (Neg p) = vars p
vars (Conj p q) = vars p ++ vars q
vars (Disj p q) = vars p ++ vars q
vars (Impl p q) = vars p ++ vars q

bits :: Int -> [[Bool]]
bits 0 = [[]]
bits n = [b:bs | bs<-bits (n-1), b<-[False,True]]

atribs :: Prop -> [Atrib]
atribs p = map (zip vs) (bits (length vs))
            where vs = nub (vars p)

showProp :: Prop -> String
showProp (Const True) = "T"
showProp (Const False) = "F"
showProp (Var x) = [x]
showProp (Neg p) = "(~" ++ showProp p ++ ")"
showProp (Conj p q) = "(" ++ showProp p ++ " && " ++ showProp q ++ ")"
showProp (Disj p q) = "(" ++ showProp p ++ " || " ++ showProp q ++ ")"
showProp (Impl p q) = "(" ++ showProp p ++ " -> " ++ showProp q ++ ")"

tabela :: Prop -> IO ()
tabela p = do
    let vs = nub (vars p)
    putStrLn (concatMap (\v -> v:"  ") vs ++ "|  " ++ showProp p)
    putStrLn (replicate (length vs * 3) '-' ++ "+--" ++ replicate (length (showProp p)) '-')
    mapM_ (printRow vs) (atribs p)

printRow :: [Char] -> Atrib -> IO ()
printRow vs s = putStrLn (concatMap (\v -> if finds v s then "T  " else "F  ") vs ++ "|  " ++ if valor s p then "T" else "F")
    where p = Conj (foldr (\x acc -> if finds x s then acc else Neg (Var x)) (Const True) vs) (foldr (\x acc -> if finds x s then Var x else Neg (Var x)) (Const True) vs)
