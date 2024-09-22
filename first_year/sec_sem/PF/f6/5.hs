{-
   O jogo "Life" de J. H. Conway

   Pedro Vasconcelos, 2021.
   Baseado na solução de G.Hutton do livro
   "Programming in Haskell", Cambridge University Press, 2007.
-}

module Main where
import Data.List (nub)        -- remover elementos repetidos
import System.Posix (usleep)  -- pausa em microsegundos
import System.IO              -- for setting stdout buffering
import System.Random (randomRIO)

-- uma posição é um par coluna, linha
type Pos = (Int,Int)

-- a colónia é representado pela lista de posições das células
type Cells  =  [Pos]

--  exemplos
block, blinker, glider  :: Cells
block = [(1,1),(1,2),(2,2),(2,1)]         -- natureza morta
blinker = [(1,2),(2,2),(3,2)]             -- oscilador
glider =  [(4,2),(2,3),(4,3),(3,4),(4,4)] -- "nave espacial"


-- dimensões da grelha "virtual"
width :: Int
width =  80

height :: Int
height =  24

-- verificar se uma posição tem ou não uma célula
isAlive  :: Cells -> Pos -> Bool
isAlive ps p = elem p ps

isEmpty :: Cells -> Pos -> Bool
isEmpty ps p =  not (isAlive ps p)

-- lista dos 8 vizinhos duma posição
neighbs :: Pos -> [Pos]
neighbs (x,y)  =  map wrap [(x-1,y-1), (x,y-1),
                            (x+1,y-1), (x-1,y),
                            (x+1,y)  , (x-1,y+1),
                            (x,y+1)  , (x+1,y+1)]

-- garantir que uma posição fica dentro dos limites da grelha virtual
wrap :: Pos -> Pos
wrap (x,y) =  (1 + (x-1) `mod` width,
               1 + (y-1) `mod` height)

-- número de células vivas vizinhas de uma posição
liveneighbs :: Cells -> Pos -> Int
--liveneighbs ps p = length (filter (isAlive ps) (neighbs p))
liveneighbs ps  = length . filter (isAlive ps) . neighbs




-- as células que sobrevivem nesta geração
survivors :: Cells -> [Pos]
survivors b
    =  [p | p <- b, elem (liveneighbs b p) [2,3]]

-- as células que nascem nesta geração
births :: Cells -> [Pos]
births b
    =  [p | p <- nub (concat (map neighbs b)),
                 isEmpty b p,
                 liveneighbs b p == 3]

-- a próxima geração: sobreviventes mais nascimentos
nextgen :: Cells -> Cells
nextgen ps =  survivors ps ++ births ps


-- código de visualização e interação
--------------------------------------------------------
{-
  Operações de posicionamento e escrita num terminal
  NB: as sequências de controlo ANSI poderão não funcionar em Windows(?)
-}

-- limpar todo o ecrân
cls :: IO ()
cls =  putStr "\ESC[2J"

-- posicionar o cursor
goto :: Pos -> IO ()
goto (x,y) = putStr ("\ESC[" ++ show y ++ ";" ++ show x ++ "H")

-- escrever texto numa posição
writeAt :: Pos -> String -> IO ()
writeAt p xs =  do goto p; putStr xs

-- esperar t milisegundos
wait  :: Int -> IO ()
wait t =  usleep (t*1000)

-- imprimir as células no tabuleiro
printCells  :: Cells -> IO ()
printCells (p:ps) = do writeAt p "O"
                       printCells ps
printCells [] = return ()

-- alternativa:
-- printCells ps =  sequence_ [writeAt p "O" | p <- ps]

randomPos :: IO Pos
randomPos = do
  x <- randomRIO (0, width-1)
  y <- randomRIO (0, height-1)
  return (x,y)


-- evolução duma colónia
-- n é o número de gerações
life :: Cells -> Int -> IO ()
life ps n
  | n>0 = do cls
             printCells ps
             wait 500
             life (nextgen ps) (n-1)
  | otherwise = return survivors n

-- criar uma lista de posições pseudo-aleatórias
randomCells :: Int -> IO Cells
randomCells n
  | n>0 = do p <- randomPos
             ps <- randomCells (n-1)
             return (p:ps)
  | otherwise = return []


-- programa principal
-- 1. desliga o "buffering" no stdout
-- 2. gera uma colónia aleatória 
-- 2. faz a animação de 100 gerações
main :: IO ()
main = do hSetBuffering stdout NoBuffering
          ps <- randomCells 300
          life (nub ps) 100