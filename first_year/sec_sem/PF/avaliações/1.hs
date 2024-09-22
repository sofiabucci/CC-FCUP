import Prelude

a
type Letras = (Char,Char)          
type Digitos = (Int,Int)           
type Matricula = (Letras, Digitos, Letras) 

bL :: Letras -> Bool
bL l = ('A' <= fst(l) && fst(l) <= 'Z') && ('A' <= snd(l) && snd(l) <= 'Z')


bD :: Digitos -> Bool
bD d = (0 <= fst(d) && fst(d) <= 9) && (0 <= snd(d) && snd(d) <= 9)


valida :: Matricula -> Bool
valida (l1, d, l2) = bL l1 && bD d && bL l2

b
import Prelude
import Data.Char

type Letras = (Char,Char)          
type Digitos = (Int,Int)          
type Matricula = (Letras, Digitos, Letras) 

convertMatInt :: Matricula -> Int
convertMatInt (l1, d, l2) = ((ord(fst(l1))-ord 'A')*(26*26*100*26))+((ord(snd(l1))-ord 'A')*(26*26*100))+(fst(d)*(10*26*26))+(snd(d)*(26*26))+((ord(fst(l2))-ord 'A')*(26))+(ord(snd(l2))-ord 'A') + 1

convertIntMat :: Int -> Matricula
convertIntMat num = ((l1,l2),(d1,d2),(l3,l4)) 
                    where l4 = chr((mod num 26) + ord 'A')  
                          l3 = chr(mod (div num 26) 26 + ord 'A')
                          d2 = mod (div num (26*26)) 10
                          d1 = mod (div num (26*26*10)) 10
                          l2 = chr(mod (div num (26*26*100)) 26 + ord 'A')
                          l1 = chr(mod (div num (26*26*100*26)) 26 + ord 'A')


incrMatricula :: Matricula -> Matricula 
incrMatricula (l1, d, l2) = convertIntMat(convertMatInt (l1, d, l2))